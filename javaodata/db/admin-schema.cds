namespace abeam.showcase.table;

using { managed,Country,Currency } from '@sap/cds/common';

entity TestEntity001 : managed {
    key IDNO : String(10);
    AMOUNT: Decimal;
};
