# escape=`
ARG BASE_IMAGE
ARG DEF_MA_ASSETS
ARG SFMC_BDE_MA_ASSETS
ARG TOOLS_ASSETS

FROM ${DEF_MA_ASSETS} as def_ma_assets
FROM ${SFMC_BDE_MA_ASSETS} as sfmc_bde_ma_assets
FROM ${TOOLS_ASSETS} as tools

FROM $BASE_IMAGE as production

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY --from=tools /tools/ /tools/
COPY --from=def_ma_assets /module/cm/content /inetpub/wwwroot
COPY --from=sfmc_bde_ma_assets /module/cm/content /inetpub/wwwroot

