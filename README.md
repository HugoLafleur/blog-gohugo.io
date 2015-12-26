blog-gohugo.io
==============

<p>This is where I'll keep track of the the blog site's progression</p>

### Notes of all kinds
1. Create Volume Container
:	docker create -v /blog/content --name blogcontent alpine /bin/true

2. Create Image from Dockerfile
:	docker build -t blog -f Dockerfile .

3. Run Container
:	docker run -P -d --name blog --volumes-from blogcontent blog:latest
:	Also see runBlog.sh

4. Access Docker Machine (when IP changes)
:	aws ec2 authorize-security-group-egress --group-id sg-b35657d5 --cidr $(publicip)/32 --protocol tcp --port 0-65535

Other Notes
:	The CMD instruction doesn't support variables, needed to create a symbolic link to the theme

To Start
:	./runBlog.sh [docker-machine-name] [container-name] [bind-port]