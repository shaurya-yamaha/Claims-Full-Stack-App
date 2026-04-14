using { CatalogService } from './service';

annotate CatalogService.Products with @(
  UI: {
    SelectionFields: [ title ], // Filter bar fields
    LineItem: [                 // Table columns
      { Value: title, Label: 'Product Title' },
      { Value: stock, Label: 'In Stock' },
      { Value: price, Label: 'Price' }
    ],
    HeaderInfo: {
        TypeName: 'Product',
        TypeNamePlural: 'Products',
        Title: { Value: title }
    },
    Facets: [                   // Groups fields on the Object Page
        { $Type: 'UI.ReferenceFacet', Label: 'Main Data', Target: '@UI.FieldGroup#Main' }
    ],
    FieldGroup #Main: {
        Data: [
            { Value: title },
            { Value: stock },
            { Value: price }
        ]
    }
  }
);
