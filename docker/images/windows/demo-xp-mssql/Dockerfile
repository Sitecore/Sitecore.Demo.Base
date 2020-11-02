# escape=`
ARG BASE_IMAGE
ARG DEF_ASSETS
ARG DEF_SFDC_ASSETS
ARG SFMC_BDE_ASSETS
ARG SFMC_CE_ASSETS
ARG DAM_ASSETS
ARG CMP_ASSETS
ARG XGEN

FROM ${DEF_ASSETS} as def_assets
FROM ${DEF_SFDC_ASSETS} as def_sfdc_assets
FROM ${SFMC_BDE_ASSETS} as sfmc_bde_assets
FROM ${SFMC_CE_ASSETS} as sfmc_ce_assets
FROM ${DAM_ASSETS} as dam_assets
FROM ${CMP_ASSETS} as cmp_assets
FROM ${XGEN} as xgen_assets

FROM $BASE_IMAGE as modules

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY --from=def_assets /module/db /module_data

RUN C:\DeployDatabases.ps1 -ResourcesDirectory /module_data; `
    Remove-Item -Path /module_data -Recurse -Force;

COPY --from=def_sfdc_assets /module/db /module_data

RUN C:\DeployDatabases.ps1 -ResourcesDirectory /module_data; `
    Remove-Item -Path /module_data -Recurse -Force;

COPY --from=sfmc_bde_assets /module/db /module_data

RUN C:\DeployDatabases.ps1 -ResourcesDirectory /module_data; `
    Remove-Item -Path /module_data -Recurse -Force;

COPY --from=sfmc_ce_assets /module/db /module_data

RUN C:\DeployDatabases.ps1 -ResourcesDirectory /module_data; `
    Remove-Item -Path /module_data -Recurse -Force;

COPY --from=dam_assets /module/db /module_data

RUN C:\DeployDatabases.ps1 -ResourcesDirectory /module_data; `
    Remove-Item -Path /module_data -Recurse -Force;

COPY --from=cmp_assets /module/db /module_data

RUN C:\DeployDatabases.ps1 -ResourcesDirectory /module_data; `
    Remove-Item -Path /module_data -Recurse -Force;

COPY --from=xgen_assets /module/db /module_data

RUN C:\DeployDatabases.ps1 -ResourcesDirectory /module_data; `
    Remove-Item -Path /module_data -Recurse -Force;