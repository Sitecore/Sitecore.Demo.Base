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
ARG HORIZON_INTEGRATION_ASSETS
ARG HORIZON_ZENITH_ASSETS
ARG HORIZON_INSIGHTS_ASSETS
ARG TOOLS_ASSETS
ARG COVEO_ASSETS
ARG COVEO_SXA_ASSETS

FROM ${DEF_ASSETS} as def_assets
FROM ${DEF_SFDC_ASSETS} as def_sfdc_assets
FROM ${SFMC_BDE_ASSETS} as sfmc_bde_assets
FROM ${SFMC_CE_ASSETS} as sfmc_ce_assets
FROM ${DAM_ASSETS} as dam_assets
FROM ${CMP_ASSETS} as cmp_assets
FROM ${XGEN_ASSETS} as xgen_assets
FROM ${SF_CRM_ASSETS} as sf_crm_assets
FROM ${HORIZON_INTEGRATION_ASSETS} as horizon_integration_assets
FROM ${HORIZON_ZENITH_ASSETS} as horizon_zenith_assets
FROM ${HORIZON_INSIGHTS_ASSETS} as horizon_insights_assets
FROM ${TOOLS_ASSETS} as tools
FROM ${COVEO_ASSETS} as coveo_assets
FROM ${COVEO_SXA_ASSETS} as coveo_sxa_assets

FROM $BASE_IMAGE as production

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY --from=tools /tools/ /tools/

COPY --from=def_assets /module/cm/content /inetpub/wwwroot
COPY --from=def_sfdc_assets /module/cm/content /inetpub/wwwroot
COPY --from=sfmc_bde_assets /module/cm/content /inetpub/wwwroot
COPY --from=sfmc_ce_assets /module/cm/content /inetpub/wwwroot
COPY --from=dam_assets /module/cm/content /inetpub/wwwroot
COPY --from=cmp_assets /module/cm/content /inetpub/wwwroot
COPY --from=xgen_assets /module/cm/content /inetpub/wwwroot
COPY --from=sf_crm_assets /module/cm/content /inetpub/wwwroot
COPY --from=horizon_integration_assets /module/cm/content /inetpub/wwwroot
COPY --from=horizon_zenith_assets /module/cm/content /inetpub/wwwroot
COPY --from=horizon_insights_assets /module/cm/content /inetpub/wwwroot
COPY --from=coveo_assets /module/cm/content /inetpub/wwwroot
COPY --from=coveo_sxa_assets /module/cm/content /inetpub/wwwroot

# https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/icacls
# (OI) = directories object inherit, (CI) = directories container inherit, F = Full access
RUN icacls 'C:\inetpub\wwwroot' /grant 'IIS_IUSRS:(OI)(CI)F' /t | Out-Null
