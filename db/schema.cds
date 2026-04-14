namespace my.company;
using { managed } from '@sap/cds/common';

entity Products : managed {
  key ID : UUID;
  title  : String(100);
  stock  : Integer;
  price  : Decimal(9,2);
}
