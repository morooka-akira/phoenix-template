FROM elixir:alpine

RUN apk update && \
    apk upgrade && \
    # imageの初期にcacheが入っている場合があるため念の為cacheを削除しておく
    rm -rf /var/cache/apk/* && \
    apk add --no-cache \
    nodejs \
    nodejs-npm

# hex, phoenix, rebarのインストール 
RUN mix local.hex --force && \
    mix archive.install hex phx_new 1.4.14 --force && \
    mix local.rebar --force
