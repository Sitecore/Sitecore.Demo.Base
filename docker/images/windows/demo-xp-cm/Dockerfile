# escape=`
ARG BASE_IMAGE
ARG DEF_ASSETS
ARG DEF_SFDC_ASSETS
ARG SFMC_BDE_ASSETS
ARG SFMC_CE_ASSETS
ARG DAM_ASSETS
ARG CMP_ASSETS
ARG XGEN_ASSETS
ARG SF_CRM_ASSETS

FROM ${DEF_ASSETS} as def_assets
FROM ${DEF_SFDC_ASSETS} as def_sfdc_assets
FROM ${SFMC_BDE_ASSETS} as sfmc_bde_assets
FROM ${SFMC_CE_ASSETS} as sfmc_ce_assets
FROM ${DAM_ASSETS} as dam_assets
FROM ${CMP_ASSETS} as cmp_assets
FROM ${XGEN_ASSETS} as xgen_assets
FROM ${SF_CRM_ASSETS} as sf_crm_assets

FROM $BASE_IMAGE as production

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY --from=def_assets /module/cm/content /inetpub/wwwroot
COPY --from=def_sfdc_assets /module/cm/content /inetpub/wwwroot
COPY --from=sfmc_bde_assets /module/cm/content /inetpub/wwwroot
COPY --from=sfmc_ce_assets /module/cm/content /inetpub/wwwroot
COPY --from=dam_assets /module/cm/content /inetpub/wwwroot
COPY --from=cmp_assets /module/cm/content /inetpub/wwwroot
COPY --from=xgen_assets /module/cm/content /inetpub/wwwroot
COPY --from=sf_crm_assets /module/cm/content /inetpub/wwwroot
