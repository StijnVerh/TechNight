using technight as db from '../db/data-model';

service TechnightService {
    entity PRODUCT_MPG_MAPPING as select * from db.PRODUCT_MPG_MAPPING;
    entity CUSTOMER_GLOBAL_GROUPS as select * from db.CUSTOMER_GLOBAL_GROUPS;
    entity SESSIONS as select * from db.SESSIONS;
}

annotate TechnightService.PRODUCT_MPG_MAPPING with @(
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

annotate TechnightService.CUSTOMER_GLOBAL_GROUPS with @(
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

annotate TechnightService.SESSIONS with @(
    UI : {
        LineItem  : [
            {
                $Type: 'UI.DataField',
                Value: Title
            },
             {
                $Type: 'UI.DataField',
                Value: Presenters
            }
        ]
    }
);
