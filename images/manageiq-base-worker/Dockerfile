ARG FROM_REPO=docker.io/manageiq
ARG FROM_TAG=latest-radjabov

FROM ${FROM_REPO}/manageiq-base:${FROM_TAG} AS vddk

COPY container-assets/ /vddk/

RUN /vddk/extract-vmware-vddk

################################################################################

FROM ${FROM_REPO}/manageiq-base:${FROM_TAG}

LABEL name="manageiq-base-worker" \
      summary="ManageIQ Worker Image"

COPY container-assets/entrypoint /usr/local/bin
COPY container-assets/manageiq_liveness_check /usr/local/bin

COPY --from=vddk /vddk/vmware-vix-disklib-distrib/ /usr/lib/vmware-vix-disklib/
COPY container-assets/install-vmware-vddk /tmp/
RUN /tmp/install-vmware-vddk

CMD ["entrypoint"]
