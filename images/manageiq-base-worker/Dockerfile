ARG FROM_REPO=gru.ocir.io/grq1iurfepyg/manageiq
ARG FROM_TAG=latest-quinteros

FROM ${FROM_REPO}/manageiq-base:${FROM_TAG} AS vddk

USER root

COPY container-assets/ /vddk/

RUN /vddk/extract-vmware-vddk

################################################################################

FROM gru.ocir.io/grq1iurfepyg/manageiq-base:edicao-giovanni

LABEL name="manageiq-base-worker" \
      summary="ManageIQ Worker Image"

USER root

COPY container-assets/entrypoint /usr/local/bin
COPY container-assets/manageiq_liveness_check /usr/local/bin

COPY --from=vddk /vddk/vmware-vix-disklib-distrib/ /usr/lib/vmware-vix-disklib/
COPY container-assets/install-vmware-vddk /tmp/
RUN /tmp/install-vmware-vddk

CMD ["entrypoint"]
