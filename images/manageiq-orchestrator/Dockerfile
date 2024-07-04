ARG FROM_REPO=docker.io/manageiq
ARG FROM_TAG=latest

FROM ${FROM_REPO}/manageiq-base:${FROM_TAG}
RUN groupadd -g 1001 appgroup && useradd -u 1001 -g appgroup appuser

LABEL name="manageiq-orchestrator" \
      summary="ManageIQ Orchestrator Image"

COPY container-assets/entrypoint /usr/local/bin



RUN chmod -R 777 /etc
RUN chmod -R 777 /var
RUN chmod -R 777 /usr
RUN chmod +x  /usr/local/bin/entrypoint

USER 1001

CMD ["entrypoint"]
