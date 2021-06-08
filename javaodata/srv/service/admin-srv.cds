namespace abeam.showcase.service;

    using { abeam.showcase.table as db } from '../../db/schema';

    service ADMIN_SRV {

        entity TTBL001 as projection on db.TTBL001;
        entity TTBL002 as projection on db.TTBL002;
    }
