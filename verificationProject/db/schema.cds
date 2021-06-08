namespace abeam.verification.table;

using { managed, } from '@sap/cds/common';

//for test entity
entity TTBL001 : managed{
    key OrdeNo  :   String(10);
    item :Composition of many TTBL002 on item.OrderNo = $self;
    };

entity TTBL002 {
    key OrderNo :   Association to TTBL001;
    key ItemNo  :   String(5);
    description :   String(20);
    amount      :   Integer;
};

entity TTBL003:managed{
    key ID : String(10);
    txt : String(10);
    num : Integer;
}

entity TTBL001Set as select from TTBL001{
    key OrdeNo,
    item.ItemNo,
    item.amount,
    item.description,
    createdBy
    };

entity TTBL003Set as select from TTBL003{
    ID,
    txt,
    num
};
