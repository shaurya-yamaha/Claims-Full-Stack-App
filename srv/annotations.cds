using {CatalogService} from './service';

// to hide claim field while creating
annotate CatalogService.Header with {
  claim @UI.Hidden: {$edmJson: {$If: [
    {$Eq: [
      {$Path: 'IsActiveEntity'},
      false
    ]},
    true,
    false
  ]}};
};

annotate CatalogService.Header with {
  chassis_no         @mandatory  @Common.Label: 'Chassis Number';
  dealer             @mandatory  @Common.Label: 'Dealer';
  claim_type         @mandatory  @Common.Label: 'Claim Type';
  processing_status  @mandatory  @Common.Label: 'Processing Status';
  claim              @Common.Label: 'Claim Number'
};

annotate CatalogService.Header with {
  dealer @Common.Text: dealer.text;
};

annotate CatalogService.Header with {
  criticality @Core.Computed;
};

annotate CatalogService.Header with {
  processing_status @(
    Common.ValueListWithFixedValues: true,
    Common.ValueList: {
    CollectionPath: 'ProcessingStatus',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: processing_status_code,
        ValueListProperty: 'code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'text'
      }
    ]
  });
};

annotate CatalogService.Header with {
  dealer @(
    Common.ValueListWithFixedValues: true,
    Common.ValueList: {
    CollectionPath: 'Dealer',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: dealer_code,
        ValueListProperty: 'code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'text'
      }
    ]
  });
};

annotate CatalogService.Header with {
  processing_status @Common.Text: processing_status.text;
  processing_status @Common.TextArrangement: #TextOnly;
  claim_type        @Common.Text: claim_type.text;
};

annotate CatalogService.Header with {
  claim_type @(Common.ValueList: {
    CollectionPath: 'ClaimTypes',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: claim_type_code,
        ValueListProperty: 'code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'text'
      }
    ]
  });
};

annotate CatalogService.Header with @(UI: {

  SelectionFields : [
    claim,
    chassis_no
  ],

  LineItem        : [
    {Value: claim},
    {Value: chassis_no},
    {Value: claim_type_code},
    {Value: dealer_code},
    {
      Value: processing_status_code,
      Label: 'Processing Status',
      Criticality: criticality,
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
      Label : 'Header Details',
      Target: '@UI.FieldGroup#Main'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Version Details',
      Target: 'versions/@UI.LineItem'
    }
  ],

  FieldGroup #Main: {
    Label: 'Header Details',
    Data : [
      {
        Value: claim,
        Label: 'Claim Number'
      },
      {
        Value: chassis_no,
        Label: 'VIN Number'
      },
      {
        Value: claim_type_code,
        Label: 'Claim Type'
      },
      {
        Value: dealer_code,
        Label: 'Dealer'
      },
      {
        Value: processing_status_code,
        Label: 'Processing Status',
        Criticality: criticality,
      }
    ]
  }
});

// for making field non editable
annotate CatalogService.Versions with {
  appl_date @Core.Computed;
};

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