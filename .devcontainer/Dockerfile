# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.166.1/containers/alpine/.devcontainer/base.Dockerfile

# [Choice] Alpine version: 3.13, 3.12, 3.11, 3.10

ARG HAXEVERSION="4.2.1"
FROM haxe:${HAXEVERSION}-buster as base

RUN  apt update -y \
&& apt install -y debian-keyring debian-archive-keyring apt-transport-https -y \
&& curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | apt-key add \
&& curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee -a /etc/apt/sources.list.d/caddy-stable.list \
&& apt update -y \
&& apt install caddy -y

FROM base as development

WORKDIR /app

# install dependencies
COPY *.hxml /app/
RUN yes | haxelib install all

# compile the project
COPY . /app
RUN haxe compile.hxml

FROM base as production

WORKDIR /app/

COPY --from=builder /app/ .

ENTRYPOINT caddy file-server