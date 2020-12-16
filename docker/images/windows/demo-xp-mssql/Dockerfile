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

FROM $BASE_IMAGE as modules

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY --from=def_assets /module/db /module_data/def_assets
COPY --from=def_sfdc_assets /module/db /module_data/def_sfdc_assets
COPY --from=sfmc_bde_assets /module/db /module_data/sfmc_bde_assets
COPY --from=sfmc_ce_assets /module/db /module_data/sfmc_ce_assets
COPY --from=dam_assets /module/db /module_data/dam_assets
COPY --from=cmp_assets /module/db /module_data/cmp_assets
COPY --from=xgen_assets /module/db /module_data/xgen_assets
COPY --from=sf_crm_assets /module/db /module_data/sf_crm_assets

RUN $modules = @('def_assets', 'def_sfdc_assets', 'sfmc_bde_assets', 'sfmc_ce_assets', 'dam_assets', 'cmp_assets', 'xgen_assets', 'sf_crm_assets'); `
    foreach($module in $modules) { C:\DeployDatabases.ps1 -ResourcesDirectory /module_data/$module; Remove-Item -Path /module_data/$module -Recurse -Force; }