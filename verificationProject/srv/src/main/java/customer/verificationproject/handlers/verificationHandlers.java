package customer.verificationproject.handlers;

import java.io.Console;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sap.cds.services.ErrorStatuses;
import com.sap.cds.services.EventContext;
import com.sap.cds.services.ServiceException;
import com.sap.cds.services.cds.CdsReadEventContext;
import com.sap.cds.services.cds.CdsService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.messages.Message;
import com.sap.cds.services.messages.Messages;
import com.sap.cds.services.persistence.PersistenceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cds.gen.abeam.verification.table.TTBL001Set;
import cds.gen.abeam.verification.table.TTBL003Set;
import customer.verificationproject.*;

@Component
@ServiceName("abeam.verification.service.TESTORDER_SRV")
public class verificationHandlers implements EventHandler{

     private static final Logger logger = LoggerFactory.getLogger(verificationHandlers.class);

    @Autowired
    Messages meessage;

//     @Before(event = CdsService.EVENT_READ,entity = "abeam.verification.service.TESTORDER_SRV.TTBL001Set")
//     public void beforeAction(TTBL001Set item) {
//         String str = "message";

//         // ServiceKey sk = new ServiceKey();
//         // String message = sk.returnMessage("my.message.key");
//         // logger.info(message,str);
// //        str = str + "OK" + item.getItemNo();
//  //       throw new ServiceException(ErrorStatuses.BAD_GATEWAY, "error occuers");
//     };

//     @On(event = CdsService.EVENT_READ,entity = "abeam.verification.service.TESTORDER_SRV.TTBL001Set")
//     public void onRead(CdsReadEventContext ctxt){
//     }

//     @After(event=CdsService.EVENT_READ,entity="abeam.verification.service.TESTORDER_SRV.TTBL001Set")
//     public void afterAction(TTBL001Set item){
//         // meessage.warn("warnning {}", item.getAmount());
//         // meessage.info("information {}", item.getAmount());
//         // meessage.error("information {}", item.getAmount());
//         // item.setAmount(item.getAmount()+100);
//     }

//     @Before(event = CdsService.EVENT_READ,entity = "abeam.verification.service.TESTORDER_SRV.TTBL002Set")
//     public void beforeAction002(TTBL001Set item,EventContext context) {
//         // System.out.println(context.getUserInfo().toString());
//         // logger.info(context.getUserInfo().toString());
//     };



//     @Before(event = CdsService.EVENT_READ,entity = "abeam.verification.service.VeriSRV.TTBL003Set",service = "abeam.verification.service.VeriSRV")
//     public void beforeAction2(TTBL003Set item) throws Exception{
// //        throw new ServiceException(ErrorStatuses.CONFLICT,"error",new ServiceException(ErrorStatuses.GATEWAY_TIMEOUT, "out"));
//     };
}