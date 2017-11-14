FROM elixir:1.5.2

WORKDIR /app
COPY . ./
RUN mix escript.build
