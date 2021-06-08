
    using { abeam.showcase.table as db } from '../db/schema';
    using { abeam.showcase.service as service } from '../srv/service';

//    annotate service.TESTORDER_SRV.TTBL001Set with @(requires:'admin');

    // annotate db.ZTBL001 with {modifiedAt @Odata.etag};
    // annotate db.ZTBL001 with @odata.draft.enabled;

    annotate service.TESTORDER_SRV.TTBL001Set with @(Capabilities: {InsertRestrictions.Insertable: true,UpdateRestrictions.Updatable: true,DeleteRestrictions.Deletable: false,SearchRestrictions.Searchable: true });            

    annotate service.TESTORDER_SRV.TTBL001Set with @(
        UI:{
            SelectionFields:[
                OrdeNo
            ],
            LineItem:[
                {$Type:'UI.DataField',Value:OrdeNo,Label:'{i18n>message1}'},
//                {$Type:'UI.DataField',Value:ItemNo},
 //               {$Type:'UI.DataField',Value:amount}
            ],
            HeaderInfo  : {
                $Type : 'UI.HeaderInfoType',
                TypeName : 'Order Detail',
                TypeNamePlural : 'Orders',
                Title : {
                    $Type : 'UI.DataField',
                    Value : OrdeNo
                },
                Description:{
                    $Type:'UI.DataField',
                    Value : OrdeNo
                }
            },
            Facets:[
                {
                    $Type : 'UI.CollectionFacet',
                    Label:'header',
                    ID:'head',
                    Facets : [
                        {$Type : 'UI.ReferenceFacet',Target : '@UI.FieldGroup#head'},
                    ],
                    
                },
                {
                    $Type : 'UI.CollectionFacet',
                    Label:'Order Detail',
                    ID:'Detail',
                    Facets:[
                        {$Type : 'UI.ReferenceFacet',Target : '@UI.FieldGroup#item'}
                    ]
            }
            ],

            FieldGroup#head:{
                $Type:'UI.FieldGroupType',Data : [
                    {$Type:'UI.DataField',Value:OrdeNo},
                    // {$Type:'UI.DataField',Value:country_code},
                    // {$Type:'UI.DataField',Value : currency_code}
                ],
            },
            FieldGroup#item :{
                $Type:'UI.FieldGroupType',Data:[
                    // {$Type:'UI.DataField',Value:ItemNo, Label:'item No'},
                    // {$Type:'UI.DataField',Value:amount, Label:'amount'},
                    // {$Type:'UI.DataField',Value:description, Label:'Description'}
                    ]
            }
        }
    );




    annotate service.ZGBLMTORDER_SRV_new.ENTITY001Set_new with @(
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

    annotate service.ZGBLMTORDER_SRV_new.ENTITY001Set with{
        customerNo @(Common.Label:'customer Number');
        dateFrom @(Common.Label:'Date');
        productID @(Common.Label:'Product ID');
    };
