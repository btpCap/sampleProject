package customer.javaodata.handlers;

import com.sap.cds.ql.Insert;
import com.sap.cds.ql.Select;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.services.ErrorStatuses;
import com.sap.cds.services.ServiceException;
import com.sap.cds.services.cds.CdsService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;

import org.springframework.stereotype.Component;
import com.sap.cds.services.draft.DraftService;
import com.sap.cds.services.draft.DraftNewEventContext;
import cds.gen.abeam.showcase.table.ENTITY001Set;
import cds.gen.abeam.showcase.table.ENTITY001Set_;
import cds.gen.abeam.showcase.table.ENTITY002Set;
import cds.gen.abeam.showcase.table.ENTITY002Set_;
import cds.gen.abeam.showcase.table.ENTITY003Set;
import cds.gen.abeam.showcase.table.ENTITY003Set_;
import cds.gen.abeam.showcase.table.ENTITY004Set;
import cds.gen.abeam.showcase.table.ENTITY004Set_;
import cds.gen.abeam.showcase.table.ENTITY005Set;
import cds.gen.abeam.showcase.table.ENTITY005Set_;

import org.springframework.beans.factory.annotation.Autowired;

import com.sap.cds.services.persistence.PersistenceService;

@Component
@ServiceName("ZGBLMTORDER_SRV")
public class Z_G_BLC_MTORDER_DPC_EXT implements EventHandler {

    @Autowired
    PersistenceService db;

    private String getStringNoPlus(String numStr) {
        int num = Integer.parseInt(numStr)+1;
        String added = String.valueOf(num);;
        return added;
    }

    String maxOrderNo = "1000000001";
    String maxItemNo = "1";
       
    @Before(event = { CdsService.EVENT_CREATE }, entity = "ZGBLMTORDER_SRV.ENTITY001Set", service = "")
    public void getMaintenanceOrderMaxNumAndCheck(ENTITY001Set item) {
        // get Maximum Maintenance Order Number
        CqnSelect selMaxOrder = Select.from(ENTITY001Set_.class).columns(c -> c.orderNo()).orderBy(c -> c.orderNo().desc())
                .limit(1);
        ENTITY001Set maxOrderSet = db.run(selMaxOrder).single(ENTITY001Set.class);
        if(maxOrderSet!=null){
            maxOrderNo = getStringNoPlus(maxOrderSet.getOrderNo());
        }
        // Product Number check
        checkProductNo(item.getProductID());
        // Customer Number check
        checkCustomerNo(item.getCustomerNo());

        item.setOrderNo(maxOrderNo);
        item.setStatusNo("NEW");
    }

    @After(event = { CdsService.EVENT_CREATE }, entity = "ZGBLMTORDER_SRV.ENTITY001Set")
    public void saveHisForCreate(ENTITY001Set item) {
        String curOrderNo = item.getOrderNo();
        ENTITY005Set entity005Set =ENTITY005Set.create();
        entity005Set.setOrderNo(curOrderNo);
        entity005Set.setItemNo("1");
        entity005Set.setStatus("NEW");
        // Save the Maintenance Order in Maintenance History
        CqnInsert insertIntoZTBL005 = Insert.into(ENTITY005Set_.class).entry(entity005Set);
        db.run(insertIntoZTBL005);
    }

    @Before(event = { CdsService.EVENT_UPDATE }, entity = "ZGBLMTORDER_SRV.ENTITY001Set")
    public void repairMaintenanceOrder(ENTITY001Set item) {
        String repPersonNo =item.getRepPersonNo();
        if (repPersonNo != null){
            checkRepairPerNo(repPersonNo);
        }
        // String curStatus =item.getStatusNo();
        // switch(curStatus){
        //     case "REPAIRED":
        //     // Repair Person Number check
        //     checkRepairPerNo(item.getRepPersonNo());
           
        //     break;
        //     case "DELETED":
        //     break;
        //     case "CLOSE":
        //     break;
        // }
    }

    @After(event = { CdsService.EVENT_UPDATE }, entity = "ZGBLMTORDER_SRV.ENTITY001Set")
    public void saveHisForUpdate(ENTITY001Set item) {
        
        // String curOrderNo = item.getOrderNo();
        //  // get History Maximum Maintenance Order Number
        // CqnSelect selMaxItemNo = Select.from(ENTITY005Set_.class).columns(c -> c.itemNo())
        // .where(c -> c.orderNo().eq(curOrderNo))
        // .orderBy(c -> c.itemNo().desc()).limit(1);
        // ENTITY005Set maxItemNoSet = db.run(selMaxItemNo).single(ENTITY005Set.class);
        // if(maxItemNoSet!=null){
        //     maxItemNo = getStringNoPlus(maxItemNoSet.getItemNo());
        // }
        // ENTITY005Set entity005Set =ENTITY005Set.create();
        // entity005Set.setOrderNo(curOrderNo);
        // entity005Set.setItemNo(maxItemNo);
        // entity005Set.setStatus(item.getStatusNo());
        // // Save the Maintenance Order in Maintenance History
        // CqnInsert insertIntoZTBL005 = Insert.into(ENTITY005Set_.class).entry(entity005Set);
        // db.run(insertIntoZTBL005);

    }


    //test edit
    // @Before(event = DraftService.EVENT_DRAFT_NEW)
    // public void prefillOrderItems(DraftNewEventContext context, ENTITY001Set orderItem) {
    //     throw new ServiceException(ErrorStatuses.NOT_FOUND, "NO OK!");
    // }











    // Product Number check
    private void checkProductNo(String productNo) {
        if (productNo == null){
            throw new ServiceException(ErrorStatuses.NOT_FOUND, "Product is null!");
        } else{
             
            CqnSelect selProductNo = Select.from(ENTITY002Set_.class).columns(c -> c.productID())
                    .where(c -> c.productID().eq(productNo));
            db.run(selProductNo).first(ENTITY002Set.class)
            .orElseThrow(() -> new ServiceException(ErrorStatuses.NOT_FOUND, "Product does not exist"));
        }
    }

    // Customer Number check
    private void checkCustomerNo(String customerNo) {
        if (customerNo == null){
            throw new ServiceException(ErrorStatuses.NOT_FOUND, "Customer is null!");
        } else{
             
            CqnSelect selCustomerNo = Select.from(ENTITY003Set_.class).columns(c -> c.customerNo())
                    .where(c -> c.customerNo().eq(customerNo));
            db.run(selCustomerNo).first(ENTITY003Set.class)
            .orElseThrow(() -> new ServiceException(ErrorStatuses.NOT_FOUND, "Customer does not exist"));
        }
    }

    // Repair Person Number check
    private void checkRepairPerNo(String repPersonNo) {
        if (repPersonNo == null){
            throw new ServiceException(ErrorStatuses.NOT_FOUND, "Repair Person is null!");
        } else{
             
            CqnSelect selRepPersonNo = Select.from(ENTITY004Set_.class).columns(c -> c.repPersonNo())
                    .where(c -> c.repPersonNo().eq(repPersonNo));
            db.run(selRepPersonNo).first(ENTITY004Set.class)
            .orElseThrow(() -> new ServiceException(ErrorStatuses.NOT_FOUND, "Repair Person does not exist"));
        }
    }

}   
    


    