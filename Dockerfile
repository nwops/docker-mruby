FROM alpine:3.6
LABEL maintainer "tsub <tsubasatakayama511@gmail.com>"

ENV MRUBY_VERSION="1.3.0" \
    ENTRYKIT_VERSION="0.4.0"

RUN apk add --update --no-cache --virtual build-dependencies \
        curl \
        unzip \
        build-base \
        bison \
        ruby && \
    curl -fSL -o mruby.zip "https://github.com/mruby/mruby/archive/${MRUBY_VERSION}.zip" && \
    unzip -d /usr/src mruby.zip && \
    rm mruby.zip && \
    cd /usr/src/mruby-${MRUBY_VERSION} && \
    ruby ./minirake && \
    mv bin/* /usr/local/bin && \
    cd && \
    rm -rf /usr/src/mruby-${MRUBY_VERSION} && \
    \
    curl -fSL -o entrykit.tgz "https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz" && \
    tar -xvzf entrykit.tgz -C /usr/local/bin && \
    entrykit --symlink && \
    rm entrykit.tgz && \
    \
    apk del --purge \
        build-dependencies

ENTRYPOINT [ \
    "switch", \
        "mirb=mirb", \
        "mrbc=mrbc", \
        "mrdb=mrdb", \
        "mruby-strip=mruby-strip", \
        "version=mruby --version", \
        "sh=/bin/sh", \
        "ash=/bin/ash", \
        "shell=/bin/ash", \
        "--", \
    "mruby" \
]

CMD ["--help"]
