ARG BASE_IMAGE
ARG DEF_ASSETS
ARG DEF_SFDC_ASSETS
ARG SFMC_BDE_ASSETS
ARG DAM_ASSETS
ARG CMP_ASSETS
ARG XGEN

FROM ${DEF_ASSETS} as def_assets
FROM ${DEF_SFDC_ASSETS} as def_sfdc_assets
FROM ${SFMC_BDE_ASSETS} as sfmc_bde_assets
FROM ${DAM_ASSETS} as dam_assets
FROM ${CMP_ASSETS} as cmp_assets
FROM ${XGEN} as xgen_assets

FROM $BASE_IMAGE as builder

USER root

RUN apt-get -y update \
    && apt-get -y --allow-unauthenticated install unzip \
    && wget -progress=bar:force -q -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=2113331 \
    && unzip -qq sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage

COPY --from=def_assets /module/db /opt/wdp/def
COPY --from=def_sfdc_assets /module/db /opt/wdp/sfmc
COPY --from=sfmc_bde_assets /module/db /opt/wdp/sfmcde
COPY --from=dam_assets /module/db /opt/wdp/dam
COPY --from=cmp_assets /module/db /opt/wdp/cmp
COPY --from=xgen_assets /module/db /opt/wdp/xgen

COPY attach-databases.sh /opt/
COPY install-databases.sh /opt/

ENV DB_PREFIX='sc'

RUN chmod +x /opt/*.sh \
    && mkdir -p /install \
    && chmod -R 700 /install \
    && cp /clean/* /install/ \
    && ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    && ./opt/attach-databases.sh /install \
    && ./opt/install-databases.sh /opt/wdp/def \
    && ./opt/install-databases.sh /opt/wdp/dam \
    && ./opt/install-databases.sh /opt/wdp/cmp \
    && ./opt/install-databases.sh /opt/wdp/sfmc \
    && ./opt/install-databases.sh /opt/wdp/sfmcde \
    && ./opt/install-databases.sh /opt/wdp/xgen

FROM $BASE_IMAGE as production

USER root

# install pwsh
RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
	&& apt-get update \
    && apt-get install -y powershell \
    && pwsh -command "Set-PackageSource -Name PSGallery -Trusted ; Install-Module -Name SqlServer"

COPY --from=builder ["/install/*", "/clean/"]

# Fix (Sitecore.) FIX LATER
COPY attach-databases.sh /opt/
COPY install-databases.sh /opt/

USER mssql
