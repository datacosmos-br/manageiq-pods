
ARG FROM_REPO=gru.ocir.io/grq1iurfepyg/manageiq
ARG FROM_TAG=latest-quinteros
ARG FROM_IMAGE=${FROM_REPO}/manageiq-base:${FROM_TAG}



# alias stage for rpms
FROM ${FROM_REPO}/manageiq-rpms:${FROM_TAG} as rpms

###############################################################################

FROM ${FROM_REPO}/manageiq-base-worker:${FROM_TAG}
ARG RPM_PREFIX=manageiq

RUN  groupadd -g 1001 appgroup && useradd -u 1001 -g appgroup appuser 
LABEL name="manageiq-webserver-worker" \
      summary="ManageIQ web server worker image"

COPY container-assets/service-worker-entrypoint /usr/local/bin

RUN --mount=type=bind,from=rpms,source=/tmp/rpms,target=/tmp/rpms \
    dnf -y install \
      ${RPM_PREFIX}-ui && \
    clean_dnf_rpm && \
    # Remove httpd default settings
    rm -f /etc/httpd/conf.d/* && \
    sed -i '/^Listen 80/d' /etc/httpd/conf/httpd.conf && \
    # Configure httpd to run without root privileges
    chgrp root /var/run/httpd && \
    chmod a+rwx /var/run/httpd && \
    chgrp root /var/log/httpd && \
    chmod a+rwx /var/log/httpd

RUN chown -R 1001:1001 /var/run/httpd /var/log/httpd /etc/pki/ca-trust

RUN chmod -R +rx /var 

# Build the RPM manifest
RUN --mount=type=bind,from=rpms,source=/tmp/rpms,target=/tmp/rpms \
    source /etc/default/evm && \
    /usr/bin/generate_rpm_manifest.sh && \
    clean_dnf_rpm

EXPOSE 3000
EXPOSE 4000

CMD ["service-worker-entrypoint"]
