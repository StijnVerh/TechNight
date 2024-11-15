using dwc.flexso as db from '../db/data-model';

service CapDatasphereHdiService {
    //entity Test as select * from db.Test;
    //entity Test2 as select * from db.Test2;
    entity PRODUCT_MPG_MAPPING as select * from db.PRODUCT_MPG_MAPPING;
    entity CUSTOMER_GLOBAL_GROUPS as select * from db.CUSTOMER_GLOBAL_GROUPS;
}

annotate CapDatasphereHdiService.Test with @odata.draft.enabled;

annotate CapDatasphereHdiService.Test2 with @odata.draft.enabled;

// annotate CapDatasphereHdiService.Test with @(
//     UI : {
//         LineItem  : [
//             {
//                 $Type: 'UI.DataField',
//                 Value: PRODUCT_ID
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: PRODUCT_LABEL
//             },{
//                 $Type: 'UI.DataField',
//                 Value: RANGE
//             },{
//                 $Type: 'UI.DataField',
//                 Value: SUBRANGE
//             },{
//                 $Type: 'UI.DataField',
//                 Value: MPG
//             },{
//                 $Type: 'UI.DataField',
//                 Value: MPG_DESCRIPTION
//             },{
//                 $Type: 'UI.DataField',
//                 Value: MPG_FACTOR
//             },{
//                 $Type: 'UI.DataField',
//                 Value: UNIT_MIX
//             },{
//                 $Type: 'UI.DataField',
//                 Value: UNIT_MIX_AMOUNT
//             },{
//                 $Type: 'UI.DataField',
//                 Value: CONVERSION_FACTOR
//             },{
//                 $Type: 'UI.DataField',
//                 Value: UNIT_MPG_ALLOCATION
//             }
//         ]
//     }
// );

// annotate CapDatasphereHdiService.Test2 with @(
//     UI : {
//         LineItem  : [
//             {
//                 $Type: 'UI.DataField',
//                 Value: ID
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: FIRST_NAME
//             },{
//                 $Type: 'UI.DataField',
//                 Value: LAST_NAME
//             }
//         ]
//     }
// );

annotate CapDatasphereHdiService.PRODUCT_MPG_MAPPING with @(
    UI : {
        LineItem  : [
            {
                $Type: 'UI.DataField',
                Value: PRODUCT_ID
            },
            {
                $Type: 'UI.DataField',
                Value: PRODUCT_LABEL
            },{
                $Type: 'UI.DataField',
                Value: RANGE
            },{
                $Type: 'UI.DataField',
                Value: SUBRANGE
            },{
                $Type: 'UI.DataField',
                Value: MPG
            },{
                $Type: 'UI.DataField',
                Value: MPG_DESCRIPTION
            },{
                $Type: 'UI.DataField',
                Value: MPG_FACTOR
            },{
                $Type: 'UI.DataField',
                Value: UNIT_MIX
            },{
                $Type: 'UI.DataField',
                Value: UNIT_MIX_AMOUNT
            },{
                $Type: 'UI.DataField',
                Value: CONVERSION_FACTOR
            },{
                $Type: 'UI.DataField',
                Value: UNIT_MPG_ALLOCATION
            }
        ]
    }
);

annotate CapDatasphereHdiService.CUSTOMER_GLOBAL_GROUPS with @(
    UI : {
        LineItem  : [
            {
                $Type: 'UI.DataField',
                Value: CustomerGroup
            },
             {
                $Type: 'UI.DataField',
                Value: CustomerGroupGlobal
            }
        ]
    }
);
