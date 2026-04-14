using { my.company as my } from '../db/schema';

service CatalogService {
  @odata.draft.enabled
  entity Products as projection on my.Products;
}
