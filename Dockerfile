FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    wget \
    git \
    curl \
    build-essential \
    strace

ENV GO_VERSION=1.24.2

RUN wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

WORKDIR /app
RUN go install github.com/air-verse/air@latest && \
ln -s /root/go/bin/air /usr/local/bin/air
CMD ["air"]