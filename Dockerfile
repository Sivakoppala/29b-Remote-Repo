FROM alpine:3.16
RUN apk add apache2 && \
    apk --update --no-cache add curl
WORKDIR /var/www/localhost/htdocs
ADD html-gen-files .
ADD update_index.sh .
RUN chmod +x update_index.sh
RUN sh update_index.sh
EXPOSE 80
ENTRYPOINT ["httpd", "-D", "FOREGROUND"]
