# escape=`
ARG BASE_IMAGE
ARG DAM_ASSETS
ARG SF_CRM_ASSETS

FROM ${DAM_ASSETS} as dam_assets
FROM ${SF_CRM_ASSETS} as sf_crm_assets

FROM $BASE_IMAGE as production

COPY --from=dam_assets /module/cm/content /inetpub/wwwroot
COPY --from=sf_crm_assets /module/cm/content /inetpub/wwwroot
