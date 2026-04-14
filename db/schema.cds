namespace Warranty;

using {managed} from '@sap/cds/common';
using {cuid} from '@sap/cds/common';

entity Header : cuid, managed {
  claim             : Integer;
  chassis_no        : String(100);
  dealer            : Integer;
  claim_type        : String(4);
  processing_status : String(4);

  versions : Composition of many Version
               on versions.header = $self;
}

entity Version : cuid, managed {
  version_no     : Integer;
  distributor    : Integer;
  Rep_start_date : Date;
  odometer_read  : Integer;
  service_order  : Integer;
  campaign_no    : Integer;
  appl_date      : Date;
  pfp            : String(20);
  symptom_code   : String(2);
  cond_code      : String(2);

  header : Association to Header;

  items : Composition of many Items
            on items.version = $self;
}

entity Items : cuid, managed {
  item_no       : Integer;
  mat_no        : String(20);
  mat_desc      : String(50);
  mat_quantity  : Integer;

  labor_code    : Integer;
  lc_desc       : String(50);
  labor_hours   : Integer;

  subl_codes    : String(5);
  subl_desc     : String(50);
  subl_quantity : Integer;

  version : Association to Version;
}
