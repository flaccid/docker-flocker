FROM python:2.7-alpine

RUN mkdir -p /usr/local/src/flocker

COPY flocker /usr/local/src/flocker

RUN apk add --update --no-cache gcc g++ linux-headers musl-dev libffi-dev openssl-dev && \
    cd /usr/local/src/flocker && \
    pip install --upgrade pip && \
    pip install --no-cache-dir . && \
    rm -rf /var/cache/apk/* && \
    rm -rf /usr/local/src

CMD ["/bin/sh"]
