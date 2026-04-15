using {CatalogService} from './service';

// to make claim field non-editable
// annotate CatalogService.Header with {
//   claim @UI.ReadOnly;
// }

// annotate CatalogService.Header with {
//   claim @Core.Computed;
// };

// to hide claim field while creating 
annotate CatalogService.Header with {
  claim @UI.Hidden: { $edmJson: { $If: [
    { $Eq: [ { $Path: 'IsActiveEntity' }, false ] },
    true,
    false
  ]}};
};

annotate CatalogService.Header with @(UI: {

  SelectionFields : [
    claim,
    chassis_no
  ],

  LineItem        : [
    {
      Value: claim,
      Label: 'Claim Number'
    },
    {
      Value: chassis_no,
      Label: 'VIN Number'
    },
    {
      Value: claim_type,
      Label: 'Claim Type'
    },
    {
      Value: dealer,
      Label: 'Dealer'
    }
  ],

  HeaderInfo      : {
    TypeName      : 'Warranty Claim',
    TypeNamePlural: 'Warranty Claims',
    Title         : {Value: claim}
  },

  Facets          : [
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Main Data',
      Target: '@UI.FieldGroup#Main'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Versions',
      Target: 'versions/@UI.LineItem'
    }
  ],

  FieldGroup #Main: {Data: [
    {
      Value: claim,
      Label: 'Claim Number'
    },
    {
      Value: chassis_no,
      Label: 'VIN Number'
    },
    {
      Value: claim_type,
      Label: 'Claim Type'
    },
    {
      Value: dealer,
      Label: 'Dealer'
    }
  ]}
});

annotate CatalogService.Versions with @(UI: {
  HeaderInfo      : {
    TypeName      : 'Claim Version Detail',
    TypeNamePlural: 'Claim Version Details',
    Title         : {Value: version_no}
  },

  LineItem        : [
    {
      Value: version_no,
      Label: 'Version'
    },
    {
      Value: distributor,
      Label: 'Distributor'
    },
    {
      Value: Rep_start_date,
      Label: 'Repair Start Date'
    },
    {
      Value: odometer_read,
      Label: 'Odometer Reading'
    },
    {
      Value: service_order,
      Label: 'Service Order Number'
    },
    {
      Value: campaign_no,
      Label: 'Campaign Number'
    },
    {
      Value: appl_date,
      Label: 'Application Date'
    },
    {
      Value: pfp,
      Label: 'PFP'
    },
    {
      Value: symptom_code,
      Label: 'Symptom Code'
    },
    {
      Value: cond_code,
      Label: 'Condition Code'
    }
  ],

  FieldGroup #Main: {Data: [
    {
      Value: version_no,
      Label: 'Version'
    },
    {
      Value: distributor,
      Label: 'Distributor'
    },
    {
      Value: Rep_start_date,
      Label: 'Repair Start Date'
    },
    {
      Value: odometer_read,
      Label: 'Odometer Reading'
    },
    {
      Value: service_order,
      Label: 'Service Order Number'
    },
    {
      Value: campaign_no,
      Label: 'Campaign Number'
    },
    {
      Value: appl_date,
      Label: 'Application Date'
    },
    {
      Value: pfp,
      Label: 'PFP'
    },
    {
      Value: symptom_code,
      Label: 'Symptom Code'
    },
    {
      Value: cond_code,
      Label: 'Condition Code'
    }
  ]},

  Facets          : [
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Version Details',
      Target: '@UI.FieldGroup#Main'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Material Items',
      Target: 'materials_asc/@UI.LineItem'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Services',
      Target: 'services_asc/@UI.LineItem'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Sublets',
      Target: 'sublets_asc/@UI.LineItem'
    }
  ]
});

annotate CatalogService.Materials with @(UI: {
  HeaderInfo: {
    TypeName      : 'Material',
    TypeNamePlural: 'Materials',
    Title         : {Value: mat_no}
  },
  LineItem  : [
    {
      Value: mat_no,
      Label: 'Item Number'
    },
    {
      Value: mat_desc,
      Label: 'Description'
    },
    {
      Value: mat_quantity,
      Label: 'Quantity'
    }
  ]
});

annotate CatalogService.Services with @(UI: {
  HeaderInfo: {
    TypeName      : 'Service',
    TypeNamePlural: 'Services',
    Title         : {Value: labor_code}
  },
  LineItem  : [
    {
      Value: labor_code,
      Label: 'Labor Code'
    },
    {
      Value: lc_desc,
      Label: 'Description'
    },
    {
      Value: labor_hours,
      Label: 'Labor Hours'
    },
    {
      Value: lc_quantity,
      Label: 'Quantity'
    }
  ]
});

annotate CatalogService.Sublets with @(UI: {
  HeaderInfo: {
    TypeName      : 'Sublet',
    TypeNamePlural: 'Sublets',
    Title         : {Value: subl_codes}
  },
  LineItem  : [
    {
      Value: subl_codes,
      Label: 'Sublet Codes'
    },
    {
      Value: subl_desc,
      Label: 'Description'
    },
    {
      Value: subl_quantity,
      Label: 'Quantity'
    }
  ]
});