FROM alpine:3.12.0
LABEL maintainer "Sanjay Kumar<sanjay.kumar@ic-consult.com>"

ARG USER=65534
ENV LOGS_STDOUT=yes
ENV DD_LOGS_STDOUT=yes

# install needed packages.
RUN apk add --no-cache curl=7.69.1-r1 && \
    apk add --no-cache jq=1.6-r1 && \
    apk add --no-cache bash=5.0.17-r0

RUN touch /tmp/output.log && chown -R $USER:$USER /tmp/output.log && ln -sf /proc/1/fd/1 /tmp/output.log

USER $USER
