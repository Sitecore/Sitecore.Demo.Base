# escape=`
ARG BASE_IMAGE
ARG DAM_ASSETS

FROM ${DAM_ASSETS} as dam_assets

FROM $BASE_IMAGE as production

# DAM
COPY --from=dam_assets /module/cm/content /inetpub/wwwroot
