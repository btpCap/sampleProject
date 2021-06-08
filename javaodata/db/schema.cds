namespace abeam.showcase.table;


using { managed,Country,Currency } from '@sap/cds/common';

entity ENTITY001Set_new as select from ZTBL001_new{
    key orderNo,
    statusNo,
    productID,
    customerNo,
    issDate,
    issTime,
    issContent,
    repPersonNo,
    dateFrom,
    timeFrom,
    dateTo,
    timeTo,
    repContent,
    price,
    currKey,
    feedBack,
    deleteFlag,
    zaction,
    foregin1,
    foregin2,
    foregin3,
    foregin4
};


entity ENTITY001Set as select from ZTBL001{
    key orderNo,
    statusNo,
    productID,
    customerNo,
    issDate,
    issTime,
    issContent,
    repPersonNo,
    dateFrom,
    timeFrom,
    dateTo,
    timeTo,
    repContent,
    price,
    currKey,
    feedBack,
    deleteFlag,
    zaction,
    foregin1,
    foregin2,
    foregin3,
    foregin4
};

@cds.odata.valuelist
entity ENTITY002Set as select from ZTBL002{
    key ZZ_PRODID   as   productID,
    key SPRAS       as   languageKey,
    ZZ_PRODNM       as   productName,
    ZZ_CATEGORY     as   productCategory,
    ZZ_PRODINFO     as   productInfo,
    ZZ_TECHINFO     as   technicalInfo,
    ZZ_ADDINFO      as   additionalInfo,
    ZZ_PRODIMG      as   imageURL,
    ZZ_PARTSINFO    as   partsInfo
};

@cds.odata.valuelist
entity ENTITY003Set as select from ZTBL003{
    key KUNNR       as   customerNo,
    key SPRAS       as   languageKey,
    NAME1           as   customerName1,
    NAME2           as   customerName2,
    TELF1           as   telepNo,
    TELFX           as   faxNo,
    EMAIL           as   emailAdd,
    LANDX           as   countryName,
    ORT01           as   cityName,
    STRAS           as   streetNo,
    PSTLZ           as   postalNo,
};

@cds.odata.valuelist
entity ENTITY004Set as select from ZTBL004{
    key ZZ_RPPERSON as   repPersonNo,
    key SPRAS       as   languageKey,
    NAME1           as   repPersonName1,
    NAME2           as   repPersonName2,
    TELF1           as   telepNo,
    TELFX           as   faxNo,
    EMAIL           as   emailAdd,
    LANDX           as   countryName,
    ORT01           as   cityName,
    STRAS           as   streetNo,
    PSTLZ           as   postalNo,
};

entity ENTITY005Set as select from ZTBL005{
    key ZZ_ORDERNO as   orderNo,
    ZZ_ITEM        as   itemNo,
    USNAM          as   userName,
    ZZ_STATUS      as   status,
    PSODT          as   changeDate,
    PSOTM          as   changeBy
};

entity ZTBL001  : managed{
    MANDT       :  String(3);
    key orderNo :  String(10);
    statusNo    :  String(10);
    productID   :  String(16);
    customerNo  :  String(12);
    issDate     :  Date;
    issTime     :  Time;
    issContent  :  String(200);
    repPersonNo :  String(12);
    dateFrom    :  Date;
    timeFrom    :  Time;
    dateTo      :  Date;
    timeTo      :  Time;
    repContent  :  String(200);
    price       :  Decimal(14,3);
    currKey     :  String(5);
    feedBack    :  String(1);
    deleteFlag  :  Boolean;
    zaction     :  Boolean;
    foregin1 : Association to many ZTBL005 on foregin1.ZZ_ORDERNO  = orderNo;
    foregin2 : Association to ZTBL002 on foregin2.ZZ_PRODID =     productID   ;
    foregin3 : Association to ZTBL003 on foregin3.KUNNR     =     customerNo    ;
    foregin4 : Association to ZTBL004 on foregin4.ZZ_RPPERSON = repPersonNo;
};

entity ZTBL001_new  : managed{
    MANDT       :  String(3);
    key orderNo :  String(10);
    statusNo    :  String(10);
    productID   :  String(16);
    customerNo  :  String(12);
    issDate     :  Date;
    issTime     :  Time;
    issContent  :  String(200);
    repPersonNo :  String(12);
    dateFrom    :  Date;
    timeFrom    :  Time;
    dateTo      :  Date;
    timeTo      :  Time;
    repContent  :  String(200);
    price       :  Decimal(14,3);
    currKey     :  String(5);
    feedBack    :  String(1);
    deleteFlag  :  Boolean;
    zaction     :  Boolean;
    foregin1 : Composition of many ZTBL005 on foregin1.ZZ_ORDERNO  = orderNo;
    foregin2 : Association to ZTBL002 on foregin2.ZZ_PRODID =     productID   ;
    foregin3 : Association to ZTBL003 on foregin3.KUNNR     =     customerNo    ;
    foregin4 : Association to ZTBL004 on foregin4.ZZ_RPPERSON = repPersonNo;
};


//Product Information
@cds.odata.valuelist
entity ZTBL002 {
    MANDT       :  String(3);
    key ZZ_PRODID   :  String(16);
    key SPRAS       :  String(1);
    ZZ_PRODNM       :  String(24);
    ZZ_CATEGORY     :  String(24);
    ZZ_PRODINFO     :  String(200);
    ZZ_TECHINFO     :  String(200);
    ZZ_ADDINFO      :  String(200);
    ZZ_PRODIMG      :  String(200);
    ZZ_PARTSINFO    :  String(200);
};

//Customer Information
@cds.odata.valuelist
entity ZTBL003 {
    MANDT       :  String(3);
    key KUNNR       :  String(12);
    key SPRAS       :  String(1);
    NAME1           :  String(35);
    NAME2           :  String(35);
    TELF1           :  String(16);
    TELFX           :  String(31);
    EMAIL           :  String(132);
    LANDX           :  String(15);
    ORT01           :  String(35);
    STRAS           :  String(35);
    PSTLZ           :  String(10);
};

//Repair Person Information
@cds.odata.valuelist
entity ZTBL004 {
    MANDT       :  String(3);
    key ZZ_RPPERSON :  String(12);
    key SPRAS       :  String(1);
    NAME1           :  String(35);
    NAME2           :  String(35);
    TELF1           :  String(16);
    TELFX           :  String(31);
    EMAIL           :  String(132);
    LANDX           :  String(15);
    ORT01           :  String(35);
    STRAS           :  String(35);
    PSTLZ           :  String(10);
};

//Maintenance History
entity ZTBL005 {
    MANDT      :  String(3);
    key ZZ_ORDERNO :  String(10);
    key ZZ_ITEM    :  String(2);
    USNAM          :  String(12);
    ZZ_STATUS      :  String(10);
    PSODT          :  Date;
    PSOTM          :  Time;
};


//for test entity
entity TTBL001 : managed{
    key OrdeNo  :   String(10);
    item :Composition of many TTBL002 on item.OrderNo = $self;
    country:Currency;
    currency:Currency;
    // @Core.IsMediaType : true 
    // imageType  : String;
    // @Core.MediaType   : imageType
    // image : LargeBinary;
    };


entity TTBL002 {
    key OrderNo :   Association to TTBL001;
    key ItemNo  :   String(5);
    description :   String(20);
    amount      :   Decimal;
};

entity TTBL003{
    key ORDERNO_ORDENO: String(10);
    key histroyNo: Integer;
}

entity TTBL001Set as select from TTBL001 {
    key OrdeNo,
    // key item.ItemNo,
    // item.description,
    // item.amount

};

entity ZENTITY001 : managed{
    key orderNo : String(10);
    item : Composition of many ZENTITY002 on item.orderNo = $self;
    amaount : Decimal;
    note : String(200);
};

entity ZENTITY002 : managed{
    key orderNo : Association to ZENTITY001;
    key itemNo : String(5);
    dateFrom : Date;
    dateTo : Date;
};

