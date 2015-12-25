# 1. Create Volume Container
# docker create -v /blog/content --name blogcontent alpine /bin/true

# 2. Create Image from Dockerfile
# docker build -t blog -f Dockerfile .

# 3. Run Container
# docker run -P -d --name blogserver --volumes-from blogcontent blog:latest

# 4. Access Container
# aws --profile handspell ec2 authorize-security-group-egress --group-id sg-b35657d5 --cidr 70.53.208.188/32 --protocol tcp --port 0-65535 

# Other Notes
# The CMD instruction doesn't support variables, needed to create a symbolic link to the theme

# To Start
# docker run\
# 	-d 
# 	-p 7070:7070 
# 	--name blog10 
# 	--volumes-from blogcontent 
# 	--volumes-from all_blogthemes 
# 	blog 
# 	server 
# 		--buildDrafts 
# 		--theme=current 
# 		--bind=0.0.0.0 
# 		--baseURL=http://$(docker-machine ip aws01) 
# 		--appendPort=true 
# 		--port=7070

FROM golang:latest
MAINTAINER Hugo Lafleur hugo.lafleur@gmail.com
RUN go get -u -v github.com/spf13/hugo
RUN hugo new site /blog
EXPOSE 1313


# ARG hugoTheme=hyde
ARG hugoTheme
WORKDIR /blog/themes
RUN ln -s /blog/all_themes/$hugoTheme current

WORKDIR /blog

CMD [" server --buildDrafts --theme=current", "--bind=0.0.0.0", "--baseURL=http://52.91.65.121/", "--appendPort=false", ""]
ENTRYPOINT ["hugo"]