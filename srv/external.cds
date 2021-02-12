    using {  API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER.csn';
    extend service external with {

      @mashup entity BusinessPartners as projection on external.A_BusinessPartner {
        key BusinessPartner as ID,
        BusinessPartnerFullName as businessPartnerFullName,
        BusinessPartnerIsBlocked as businessPartnerIsBlocked,
        SearchTerm1 as searchTerm1
      }
    }

    @cds.persistence:{table,skip:false}
    @cds.autoexpose
    entity sap.ui.riskmanagement.BusinessPartners as projection on external.BusinessPartners;

    using { sap.ui.riskmanagement as my } from '../db/schema';
    extend my.Risks with {
      bp : Association to my.BusinessPartners;
    }