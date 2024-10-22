ARG MICRODIR=/microdir
ARG PACKAGES_TO_INSTALL="fluent-bit"

FROM redhat/ubi9-micro AS BASE
COPY fluent-bit.repo /etc/yum.repos.d/

FROM redhat/ubi9 AS BUILD
ARG MICRODIR
ARG PACKAGES_TO_INSTALL
RUN mkdir ${MICRODIR}
COPY --from=BASE / ${MICRODIR}
RUN yum install \
  --installroot ${MICRODIR} \
  --releasever 9 \
  --setop install_weak_deps=false \
  -y \
  ${PACKAGES_TO_INSTALL}
RUN yum clean all \
  --installroot ${MICRODIR}

FROM scratch AS IMAGE
ARG MICRODIR
COPY --from=BUILD ${MICRODIR}/ .
RUN groupadd -g 101 sag && useradd -ms /usr/bin/bash -u101 -g101 fluentbit && mkdir /opt/fluent-bit/etc
COPY fluent-bit.conf /opt/fluent-bit/etc/fluent-bit.conf
COPY parsers.conf /opt/fluent-bit/etc/parsers.conf
USER fluentbit
ENTRYPOINT ["/opt/fluent-bit/bin/fluent-bit","-c","/opt/fluent-bit/etc/fluent-bit.conf"]
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD ls -l /proc/*/exe 2>&1|grep "fluent-bit" || exit 1
