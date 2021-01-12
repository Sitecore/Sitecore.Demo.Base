# escape=`
ARG BASE_IMAGE
ARG DAM_ASSETS
ARG SF_CRM_ASSETS
ARG TOOLS_ASSETS

FROM ${DAM_ASSETS} as dam_assets
FROM ${SF_CRM_ASSETS} as sf_crm_assets
FROM ${TOOLS_ASSETS} as tools

FROM $BASE_IMAGE as production

COPY --from=tools /tools/ /tools/

COPY --from=dam_assets /module/cm/content /inetpub/wwwroot
COPY --from=sf_crm_assets /module/cm/content /inetpub/wwwroot

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/icacls
# (OI) = directories object inherit, (CI) = directories container inherit, F = Full access
RUN icacls 'C:\inetpub\wwwroot' /grant 'IIS_IUSRS:(OI)(CI)F' /t | Out-Null
