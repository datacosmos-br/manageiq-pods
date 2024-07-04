ARG FROM_REPO=gru.ocir.io/grq1iurfepyg/manageiq
ARG FROM_TAG=latest-quinteros
ARG FROM_IMAGE=${FROM_REPO}/manageiq-base:${FROM_TAG}

FROM ${FROM_IMAGE}

LABEL name="manageiq-orchestrator" \
      summary="ManageIQ Orchestrator Image"

ARG CONTAINER_IMAGE_NAMESPACE=${FROM_REPO}
ARG CONTAINER_IMAGE_TAG=${FROM_TAG}

RUN  groupadd -g 1001 appgroup && useradd -u 1001 -g appgroup appuser


COPY container-assets/entrypoint /usr/local/bin


RUN chmod a+rwx /user/loca/bin/entrypoint
RUN chown -R 1001:1001 /usr/local/bin/entrypoint
USER  1001

CMD ["entrypoint"]
