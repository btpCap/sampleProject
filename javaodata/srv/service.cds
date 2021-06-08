namespace abeam.showcase.service;

    using { abeam.showcase.table as db } from '../db/schema';
    
/*    annotate ZGBLMTORDER_SRV.ENTITY001Set with @(
        UI:{
            SelectionFields:[
                orderNo,
                statusNo,
                productID
            ],
            LineItem:[
                {$Type:'UI.DataField',Value:orderNo},
                {$Type:'UI.DataField',Value:statusNo},
                {$Type:'UI.DataField',Value:customerNo},
                {$Type:'UI.DataField',Value:productID},
                {$Type:'UI.DataField',Value:repPersonNo}
            ],
            LineItem#history:[
                {$Type:'UI.DataField',Value:foregin1.orderNo},
                {$Type:'UI.DataField',Value:foregin1.itemNo},
                {$Type:'UI.DataField',Value:foregin1.status},
                {$Type:'UI.DataField',Value:foregin1.changeDate},
                {$Type:'UI.DataField',Value:foregin1.changeBy}
            ],
            HeaderInfo  : {
                $Type : 'UI.HeaderInfoType',
                TypeName : 'Order Detail',
                TypeNamePlural : 'Orders',
                Title : {
                    $Type : 'UI.DataField',
                    Value : orderNo
                },
                Description:{
                    $Type:'UI.DataField',
                    Value : dateFrom
                },
                ImageUrl:{
                    $value :foregin2.imageURL
                }
            },
            HeaderFacets:[
                {$Type:'UI.ReferenceFacet',Target:'@UI.FieldGroup#Main'},
                {$Type:'UI.ReferenceFacet',Target:'@UI.DataPoint#status'},
                {$Type:'UI.ReferenceFacet',Target:'@UI.DataPoint#Rating'}
            ],
            DataPoint#status:{
                $Type:'UI.DataPointType',Title:'Status',Value:statusNo
            },
            DataPoint#Rating:{
                $Type:'UI.DataPointType',Title:'Rating',Value : feedBack,TargetValue:5
            },
            FieldGroup#Main  : {
                $Type : 'UI.FieldGroupType',Data : [
                    {
                        $Type : 'UI.DataField',
                        Value : foregin2.productCategory,
                    },
                    {$Type : 'UI.DataField',Value :foregin2.productName,Label:'Product Name'},
                    {$Type:'UI.DataField',Value:productID,Label:'Product ID'},
                    {$Type:'UI.DataField',Value:orderNo,Label:'Order No'},
                    {$Type:'UI.DataField',Value:dateFrom,Label:'Date From'}
                ],
                
            },
            FieldGroup#MT1:{
                $Type:'UI.FieldGroupType',Data:[
                    {$Type:'UI.DataField',Value : dateFrom,Label:'Date From'},
                    {$Type:'UI.DataField',Value:dateTo,Label:'Date To'},
                    {$Type:'UI.DataField',Value:foregin4.countryName,Label:'Country'},
                    {$Type:'UI.DataField',Value:foregin4.streetNo,Label:'Street'},
                    {$Type:'UI.DataField',Value:foregin4.postalNo,Label:'Postal Code'}
                ]
            },
            FieldGroup#MT2:{
                $Type:'UI.FieldGroupType',Data:[
                    {$Type:'UI.DataField',Value:foregin4.repPersonNo,Label:'Repair Person No'},
                    {$Type:'UI.DataField',Value:foregin4.repPersonName1,Label:'Repair Person Name'},
                    {$Type:'UI.DataField',Value:foregin4.telepNo,Label:'Telephone Number'},
                    {$Type:'UI.DataField',Value:foregin4.faxNo,Label:'Fax Numbe'},
                    {$Type:'UI.DataField',Value:foregin4.emailAdd,Label:'E-Mail'}
                ]
            },
            FieldGroup#MT3:{
                $Type:'UI.FieldGroupType',Data:[
                    {$Type:'UI.DataField',Value:price,Label:'Price'},
                    {$Type:'UI.DataField',Value:repContent,Label:'Repair Content'}
                ]
            },
            FieldGroup#ProductHomepage:{
                $Type:'UI.FieldGroupType',
                Data:[{
                    $Type:'UI.DataFieldWithUrl',
                    Url:foregin2.productInfo,
                    Value:foregin2.productInfo,
                    Label:'Product Home Page'
                    }
                ]
            },
            FieldGroup#PartsInformation:{
                $Type:'UI.FieldGroupType',Data : [ 
                    {$Type:'UI.DataFieldWithUrl',
                    Url:foregin2.partsInfo,
                    Value:foregin2.partsInfo,
                    Label:'Parts Infomation'
                    }                    
                ],
            },
            FieldGroup#TechnicalInformation:{
                $Type:'UI.FieldGroupType',Data : [
                    {$Type:'UI.DataFieldWithUrl',
                    Url:foregin2.technicalInfo,
                    Value:foregin2.technicalInfo,
                    Label:'technicalInformation'}
                ]
            },
            FieldGroup#AdditionalInformation:{
                $Type:'UI.FieldGroupType',Data:[
                    {$Type:'UI.DataFieldWithUrl',
                    Url:foregin2.additionalInfo,
                    Value:foregin2.additionalInfo,
                    Label:'additional Information'}
                ]
            },
            FieldGroup#Customerformation:{
                $Type:'UI.FieldGroupType',Data:
                [
                    {$Type:'UI.DataField',Value:foregin3.customerNo,Label:'Customer No'},
                    {$Type:'UI.DataField',Value:foregin3.customerName1,Label:'Customer Name'},
                    {$Type:'UI.DataField',Value:foregin3.customerName2},
                    {$Type:'UI.DataField',Value:foregin3.emailAdd,Label:'E-mail'},
                    {$Type:'UI.DataField',Value:foregin3.streetNo,Label:'Street'},
                    {$Type:'UI.DataField',Value:foregin3.cityName,Label:'City'},
                    {$Type:'UI.DataField',Value:foregin3.countryName,Label:'Country'},
                    {$Type:'UI.DataField',Value:foregin3.postalNo,Label:'Postal Code'},
                    {$Type:'UI.DataField',Value:foregin3.telepNo,Label:'Tel'},
                    {$Type:'UI.DataField',Value:foregin3.faxNo,Label:'Fax'}

                ]
            },
            Facets:[{
                $Type : 'UI.CollectionFacet',
                Label:'Product Info Detail',
                ID:'Product',
                Facets:[
                    {$Type:'UI.ReferenceFacet',Target:![@UI.FieldGroup#ProductHomepage],Label:''},
                    {$Type:'UI.ReferenceFacet',Target:![@UI.FieldGroup#PartsInformation],Label:''},
                    {$Type:'UI.ReferenceFacet',Target:![@UI.FieldGroup#TechnicalInformation],Label:''},
                    {$Type:'UI.ReferenceFacet',Target:![@UI.FieldGroup#AdditionalInformation],Label:''}
                    ]

                },
                {$Type:'UI.CollectionFacet',
                Label:'maintenance Information',
                ID:'Repairinfor',
                Facets:[
                    {$Type:'UI.ReferenceFacet',Target:![@UI.FieldGroup#Main]},
                    {$Type:'UI.ReferenceFacet',Target:![@UI.FieldGroup#MT1]},
                    {$Type:'UI.ReferenceFacet',Target:![@UI.FieldGroup#MT2]},
                    {$Type:'UI.ReferenceFacet',Target:![@UI.FieldGroup#MT3]}
                    ]
                },
                {$Type:'UI.CollectionFacet',
                Label:'maintenance history',
                ID:'History',
                Facets:[
                    {$Type:'UI.ReferenceFacet',Target:![@UI.LineItem#history],Label:'maintenance history'},
                    ]
                },
                {$Type:'UI.CollectionFacet',
                Label:'Customer infomation',
                ID:'Customer',
                Facets:[
                    {$Type:'UI.ReferenceFacet',Target:![@UI.FieldGroup#Customerformation]}
                ]}
            ]
        }
        ); 

    annotate ZGBLMTORDER_SRV.ENTITY001Set with{
        customerNo @(Common.Label:'customer Number');
        dateFrom @(Common.Label:'Date');
        productID @(Common.Label:'Product ID');
    };
    
    annotate ZGBLMTORDER_SRV.ENTITY001Set.customerNo with @(
        Common.ValueList :{
            CollectionPath:'ENTITY003Set',
            Label:'Customer',
            Parameters:[{
                $Type:'Common.ValueListParameterInOut',
                ValueListProperty : 'customerNo',
                LocalDataProperty : customerNo
            }]
            
        }
    );

    annotate ZGBLMTORDER_SRV.ENTITY005Set with @(
        UI:{
            LineItem#History:[
                {$Type:'UI.DataField',Value:orderNo},
                {$Type:'UI.DataField',Value:itemNo},
                {$Type:'UI.DataField',Value:status},
                {$Type:'UI.DataField',Value:changeDate},
                {$Type:'UI.DataField',Value:changeBy}]
        }
    );
*/

    service AdminService {
       entity ZTBL001 as projection on db.ZTBL001;
       entity ZTBL002 as projection on db.ZTBL002;
       entity ZTBL003 as projection on db.ZTBL003;
       entity ZTBL004 as projection on db.ZTBL004;
       entity ZTBL005 as projection on db.ZTBL005;
    }

    service ZGBLMTORDER_SRV {
       entity ENTITY001Set as projection on db.ENTITY001Set;
       entity ENTITY002Set as projection on db.ENTITY002Set;
       entity ENTITY003Set as projection on db.ENTITY003Set;
       entity ENTITY004Set as projection on db.ENTITY004Set;
       entity ENTITY005Set as projection on db.ENTITY005Set;
    }

    service ZGBLMTORDER_SRV_new {
       entity ENTITY001Set_new as projection on db.ENTITY001Set_new;
       entity ENTITY002Set as projection on db.ENTITY002Set;
       entity ENTITY003Set as projection on db.ENTITY003Set;
       entity ENTITY004Set as projection on db.ENTITY004Set;
       entity ENTITY005Set as projection on db.ENTITY005Set;
    }

    service TESTORDER_SRV {

        entity TTBL001Set as projection on db.TTBL001Set;
        entity TTBL001 as projection on db.TTBL001;
        entity TTBL002 as projection on db.TTBL002;
    }

    service ZENTITY_SRV{
        entity ZENTITY001 as projection on db.ZENTITY001;
        entity ZENTITY002 as projection on db.ZENTITY002;
    }
