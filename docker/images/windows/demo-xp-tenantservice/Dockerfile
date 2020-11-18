# escape=`
ARG BASE_IMAGE
ARG SF_CRM_TS_ASSETS
ARG SFMC_BDE_TS_ASSETS

FROM ${SF_CRM_TS_ASSETS} as sf_crm_ts_assets
FROM ${SFMC_BDE_TS_ASSETS} as sfmc_bde_ts_assets

FROM $BASE_IMAGE as production

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY --from=sf_crm_ts_assets /module/cm/content /inetpub/wwwroot
COPY --from=sfmc_bde_ts_assets /module/cm/content /inetpub/wwwroot


