using{abeam.verification.service as service} from '../srv/service';
using {abeam.verification.table as db  } from '../db/schema';


//annotate service.TESTORDER_SRV.TTBL002Set with @(requires: ['admin']);
//annotate service.TESTORDER_SRV with @(requires: ['Edit']);
//annotate service.TESTORDER_SRV.TTBL001Set with @(restrict :[{grant:['*'],to:'Edit',where: 'createdBy = $user.id'}]);
annotate db.TTBL001 with{modifiedAt @odata.etag}

annotate service.TESTORDER_SRV.TTBL001Set with @(
    UI:{
        SelectionFields:[ItemNo],
        LineItem:[
            {$Type:'UI.DataField',Value:OrdeNo},
            {$Type:'UI.DataField',Value : ItemNo},
            {$Type:'UI.DataField',Value:amount}
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
                    {$Type:'UI.DataField',Value:createdBy}
                ],
            },
            FieldGroup#item :{
                $Type:'UI.FieldGroupType',Data:[
                    {$Type:'UI.DataField',Value:ItemNo, Label:'item No'},
                    {$Type:'UI.DataField',Value:amount, Label:'amount'},
                    {$Type:'UI.DataField',Value:description, Label:'Description'}
                    ]
            }
    }

);