FROM alpine:latest

RUN apk update && apk add bash && apk add sudo
RUN mkdir /app

WORKDIR /app
COPY . /app

ENTRYPOINT ["bash","data_cleaning.sh" ]
