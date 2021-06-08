package customer.javaodata.handlers2;

import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.messages.Messages;
import com.sap.cds.services.persistence.PersistenceService;
import com.sap.cds.services.request.UserInfo;
import com.sap.cds.ql.Insert;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.services.ErrorStatuses;
import com.sap.cds.services.EventContext;
import com.sap.cds.services.ServiceException;
import com.sap.cds.services.cds.CdsService;
import com.sap.cds.services.changeset.ChangeSetContext;
import com.sap.cds.services.changeset.ChangeSetListener;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cds.gen.abeam.showcase.table.TTBL001Set;
import cds.gen.abeam.showcase.table.Ttbl003;
import cds.gen.abeam.showcase.table.Ttbl003_;
import customer.javaodata.MessageKeys;

@Component
@ServiceName("abeam.showcase.service.TESTORDER_SRV")
public class testService implements EventHandler{

    @Autowired
    Messages message;

    @Autowired
    PersistenceService db;

    // @Autowired
    // CdsService cdsService;

    private static final Logger logger = LoggerFactory.getLogger(testService.class);

    @Before(event = {CdsService.EVENT_READ} , entity = "abeam.showcase.service.TESTORDER_SRV.TTBL001Set")
    public void beforAction(TTBL001Set ctx) {
        Date now = new Date();
        logger.info( now + " : Call Read Service, Start event");
        
        // Get Message
        MessageKeys messageKeys = new MessageKeys();        
        String message = messageKeys.returnMessage("my.message.key"); 
        logger.info(message,now);

    }

    @After(entity = "abeam.showcase.service.TESTORDER_SRV.TTBL001Set",event={CdsService.EVENT_READ})
    public void onAction(TTBL001Set ttbl001Set,EventContext context){
        //throw new ServiceException(ErrorStatuses.BAD_REQUEST,"Not Enough(Agfter)");
        // calicualte amount
        // Integer amount = ttbl001Set.getAmount();
        // if(amount != null) {
        //     amount = amount + 200;
        // }
        // ttbl001Set.setAmount(amount); 

        
        // // Add meesage
        message.info("error {}", "information");
        message.warn("error {}", "warning");
        message.error("error {}", "error");
        message.success("success {}", "success");
        // EventContext context = EventContext.create("myEvent", null);
        // context.getMessages().info("error information");

        // select Max History No
        // String orderno = ttbl001Set.getOrdeNo();
        // CqnSelect selMaxOrder = Select.from(Ttbl003_.class).columns(
        //     c -> c.histroyNo()
        //     ,c ->c.ORDERNO_ORDENO()
        //     ).where(c -> c.ORDERNO_ORDENO().eq(orderno)).orderBy(
        //         c -> c.histroyNo().desc()
        //         ).limit(1);


        // Ttbl003 maxhistory = db.run(selMaxOrder).single(Ttbl003.class);

        // int historyNo = 1;
        // if(maxhistory !=null){
        //     historyNo = maxhistory.getHistroyNo() + 1;
        // }

        // // insert to Other Table
        // Ttbl003 ttbl003 = Ttbl003.create();
        // ttbl003.setOrdernoOrdeno(orderno);
        // ttbl003.setHistroyNo(historyNo);
        // CqnInsert insertIntoZTBL005 = Insert.into(Ttbl003_.class).entry(ttbl003);
        // db.run(insertIntoZTBL005);


    }

    @On(entity = "abeam.showcase.service.TESTORDER_SRV.TTBL001Set",event={CdsService.EVENT_CREATE,CdsService.EVENT_READ})
    public void afterAction(TTBL001Set ttbl001Set){
        logger.warn("End Event.");
        logger.error("error.");
       logger.debug("debug.");
       logger.trace("trave.");
 
    }

    @Before(event ={CdsService.EVENT_CREATE}, entity = "abeam.showcase.service.TESTORDER_SRV.TTBL001Set" )
    public void insertBeforeAction(TTBL001Set ctx){
        // throw new ServiceException(ErrorStatuses.CONFLICT,"Failed Create (manual)");
    }

    @After(event = {CdsService.EVENT_CREATE}, entity = "abeam.showcase.service.TESTORDER_SRV.TTBL001Set")
    @Transactional
    public void insertAfterAction(TTBL001Set ctx,EventContext context){


        ChangeSetContext changeSet = context.getChangeSetContext();
        changeSet.register(new ChangeSetListener() {
        
            @Override
            public void beforeClose() {
                // ChangeSetListener.super.beforeClose();
                //changeSet.markForCancel();
                //throw new ServiceException(ErrorStatuses.LOCKED,"Same Transaction Error");
            }

            @Override
            public void afterClose(boolean completed) {
//                ChangeSetListener.super.afterClose(completed);
                // insert to Other Table
                if(completed){
                try{

                Ttbl003 ttbl003 = Ttbl003.create();
                ttbl003.setOrdernoOrdeno(ctx.getOrdeNo());
                ttbl003.setHistroyNo(1);
                CqnInsert insertIntoZTBL005 = Insert.into(Ttbl003_.class).entry(ttbl003);
                db.run(insertIntoZTBL005);

                // throw new ServiceException(ErrorStatuses.LOCKED,"Other Transaction Error");
                }
                catch(Exception e){
                    throw e;
                }



//                logger.info("Log After Transaction Close");


            }else{
                logger.error("process failed.");

            }


            }
        });


    }





}