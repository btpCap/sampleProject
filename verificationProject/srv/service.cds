namespace abeam.verification.service;

using{abeam.verification.table as db} from '../db/schema';

service TESTORDER_SRV{
    entity TTBL001Set as projection on db.TTBL001Set;
    entity TTBL002Set as projection on db.TTBL002;  
    };

service VeriSRV{
    entity TTBL003Set as projection on db.TTBL003Set;
}

