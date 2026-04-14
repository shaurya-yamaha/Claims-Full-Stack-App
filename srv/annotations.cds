using { CatalogService } from './service';

annotate CatalogService.Header with @(
  UI: {
    SelectionFields: [ claim, chassis_no ],

    LineItem: [
      { Value: claim, Label: 'Claim Number' },
      { Value: chassis_no, Label: 'VIN Number' },
      { Value: claim_type, Label: 'Claim Type' },
      { Value: dealer, Label: 'Dealer' }
    ],

    HeaderInfo: {
        TypeName: 'Warranty Claim',
        TypeNamePlural: 'Warranty Claims',
        Title: { Value: claim }
    },

    Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Main Data',
            Target: '@UI.FieldGroup#Main'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Versions',
            Target: 'versions/@UI.LineItem'
        }
    ],

    FieldGroup #Main: {
        Data: [
            { Value: claim },
            { Value: chassis_no },
            { Value: claim_type },
            { Value: dealer }
        ]
    }
  }
);

annotate CatalogService.Versions with @(
  UI: {
    HeaderInfo: {
      TypeName: 'Version',
      TypeNamePlural: 'Versions',
      Title: { Value: version_no }
    },

    LineItem: [
      { Value: version_no },
      { Value: distributor },
      { Value: Rep_start_date },
      { Value: odometer_read },
      { Value: service_order },
      { Value: campaign_no },
      { Value: appl_date },
      { Value: pfp },
      { Value: symptom_code },
      { Value: cond_code }
    ],

    FieldGroup#Main: {
      Data: [
        { Value: version_no },
        { Value: distributor },
        { Value: Rep_start_date },
        { Value: odometer_read },
        { Value: service_order },
        { Value: campaign_no },
        { Value: appl_date },
        { Value: pfp },
        { Value: symptom_code },
        { Value: cond_code }
      ]
    },

    Facets: [
      {
        $Type: 'UI.ReferenceFacet',
        Label: 'Version Details',
        Target: '@UI.FieldGroup#Main'
      },
      {
        $Type: 'UI.ReferenceFacet',
        Label: 'Material Items',
        Target: 'materials_asc/@UI.LineItem'
      },
      {
        $Type: 'UI.ReferenceFacet',
        Label: 'Services',
        Target: 'services_asc/@UI.LineItem'
      },
      {
        $Type: 'UI.ReferenceFacet',
        Label: 'Sublets',
        Target: 'sublets_asc/@UI.LineItem'
      }
    ]
  }
);

annotate CatalogService.Materials with @(
  UI: {
    HeaderInfo: {
      TypeName: 'Material',
      TypeNamePlural: 'Materials',
      Title: { Value: mat_no }
    },
    LineItem: [
      { Value: item_no },
      { Value: mat_no },
      { Value: mat_desc },
      { Value: mat_quantity }
    ]
  }
);

annotate CatalogService.Services with @(
  UI: {
    HeaderInfo: {
      TypeName: 'Service',
      TypeNamePlural: 'Services',
      Title: { Value: labor_code }
    },
    LineItem: [
      { Value: labor_code },
      { Value: lc_desc },
      { Value: labor_hours },
      { Value: lc_quantity }
    ]
  }
);

annotate CatalogService.Sublets with @(
  UI: {
    HeaderInfo: {
      TypeName: 'Sublet',
      TypeNamePlural: 'Sublets',
      Title: { Value: subl_codes }
    },
    LineItem: [
      { Value: subl_codes },
      { Value: subl_desc },
      { Value: subl_quantity }
    ]
  }
);