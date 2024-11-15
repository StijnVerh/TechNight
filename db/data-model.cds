namespace dwc.flexso;

entity Test {
  @Common.Label : 'Product ID'
  key PRODUCT_ID : UUID @readonly;
  @Common.Label : 'Product Label'
  PRODUCT_LABEL : String(100);
  @Common.Label : 'Range'
  RANGE: String(100);
  @Common.Label : 'Subrange'
  SUBRANGE: String(100);
  @Common.Label : 'MPG'
  MPG: String(100);
  @Common.Label : 'MPG Description'
  MPG_DESCRIPTION: String(100);
  @Common.Label : 'MPG Factor'
  MPG_FACTOR: Integer;
  @Common.Label : 'Unit Mix'
  UNIT_MIX: String(100);
  @Common.Label : 'Unit Mix Amount'
  UNIT_MIX_AMOUNT: Decimal;
  @Common.Label : 'Conversion Factor'
  CONVERSION_FACTOR: Decimal;
  @Common.Label : 'Unit MPG Allocation'
  UNIT_MPG_ALLOCATION: String(100);
}

entity Test2 {
  @Common.Label : 'ID'
  key ID : String(100);
  @Common.Label : 'First Name'
  FIRST_NAME : String(100);
  @Common.Label : 'Last Name'
  LAST_NAME: String(100);
}

entity PRODUCT_MPG_MAPPING {
  @Common.Label : 'Product ID'
  key PRODUCT_ID : UUID @readonly;
  @Common.Label : 'Product Label'
  PRODUCT_LABEL : String(100);
  @Common.Label : 'Range'
  RANGE: String(100);
  @Common.Label : 'Subrange'
  SUBRANGE: String(100);
  @Common.Label : 'MPG'
  MPG: String(100);
  @Common.Label : 'MPG Description'
  MPG_DESCRIPTION: String(100);
  @Common.Label : 'MPG Factor'
  MPG_FACTOR: Integer;
  @Common.Label : 'Unit Mix'
  UNIT_MIX: String(100);
  @Common.Label : 'Unit Mix Amount'
  UNIT_MIX_AMOUNT: Decimal;
  @Common.Label : 'Conversion Factor'
  CONVERSION_FACTOR: Decimal;
  @Common.Label : 'Unit MPG Allocation'
  UNIT_MPG_ALLOCATION: String(100);
}

entity CUSTOMER_GLOBAL_GROUPS {
  @Common.Label : 'Customer Group'
  key CustomerGroup : Integer;
  @Common.Label : 'Customer Group Global'
  CustomerGroupGlobal: String;
}