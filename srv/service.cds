using {Warranty} from '../db/schema';

service CatalogService {

  @odata.draft.enabled
  entity Header           as
    projection on Warranty.Header {
      *,
      versions
    };

  entity Versions         as
    projection on Warranty.Versions {
      *,
      materials_asc,
      services_asc,
      sublets_asc
    };

  entity Materials        as projection on Warranty.Materials;
  entity Services         as projection on Warranty.Services;
  entity Sublets          as projection on Warranty.Sublets;
  entity ProcessingStatus as projection on Warranty.ProcessingStatus;
  entity ClaimTypes       as projection on Warranty.ClaimTypes;
}