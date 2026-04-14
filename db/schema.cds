namespace Warranty;

using {managed} from '@sap/cds/common';
using {cuid} from '@sap/cds/common';

entity Header : cuid, managed {
  claim             : Integer;
  chassis_no        : String(100);
  dealer            : Integer;
  claim_type        : String(4);
  processing_status : String(4);

  versions          : Composition of many Versions
                        on versions.header = $self;
}

entity Versions : cuid, managed {
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

  header         : Association to Header;

  materials_asc  : Composition of many Materials
                     on materials_asc.version = $self;

  services_asc   : Composition of many Services
                     on services_asc.version = $self;

  sublets_asc    : Composition of many Sublets
                     on sublets_asc.version = $self;
}

entity Materials : cuid, managed {
  item_no      : Integer;
  mat_no       : String(20);
  mat_desc     : String(50);
  mat_quantity : Integer;

  version      : Association to Versions;
}

entity Services : cuid, managed {

  labor_code  : Integer;
  lc_desc     : String(50);
  labor_hours : Integer;
  lc_quantity : Integer;

  version     : Association to Versions;
}

entity Sublets : cuid, managed {
  subl_codes    : String(5);
  subl_desc     : String(50);
  subl_quantity : Integer;

  version       : Association to Versions;
}
