FROM golang:latest
MAINTAINER Hugo Lafleur hugo.lafleur@gmail.com
RUN go get -u -v github.com/spf13/hugo
RUN hugo new site /blog
EXPOSE 1313

ADD blog /blog
ADD logs /var/log/hugo

WORKDIR /blog

CMD ["hugo", "--buildDrafts=true", "--theme=current"]