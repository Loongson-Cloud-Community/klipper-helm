FROM cr.loongnix.cn/library/alpine:3.11 as extract
RUN apk add -U curl ca-certificates
ARG ARCH
RUN curl -L https://github.com/Loongson-Cloud-Community/helm/releases/download/v2.16.10/helm-v2.16.10-linux_loong64.tar.gz | tar xvzf - --strip-components=1 -C /usr/bin
RUN mv /usr/bin/helm /usr/bin/helm_v2
RUN curl -L https://github.com/Loongson-Cloud-Community/helm/releases/download/v3.3.1/helm-v3.3.1-linux_loong64.tar.gz | tar xvzf - --strip-components=1 -C /usr/bin
RUN mv /usr/bin/helm /usr/bin/helm_v3

FROM cr.loongnix.cn/library/alpine:3.11
RUN apk add -U --no-cache ca-certificates jq bash git
COPY --from=extract /usr/bin/helm_v2 /usr/bin/helm_v3 /usr/bin/tiller /usr/bin/
COPY entry /usr/bin/
ENTRYPOINT ["entry"]
ENV STABLE_REPO_URL=https://charts.helm.sh/stable/
