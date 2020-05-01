FROM elixir:1.10.3-alpine
RUN apk add --update nodejs npm
RUN apk add --update npm 
RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.5.1
WORKDIR /app
COPY . /app
EXPOSE 4000