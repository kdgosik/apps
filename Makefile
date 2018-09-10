all: shiny-images flask-images goapp-images node-images

shiny-images:
	docker build -t kdgosik/apps:shiny shiny
	docker build -t kdgosik/apps:shiny-template shiny/template
	docker build -t kdgosik/apps:shiny-clifford-attractor shiny/apps/clifford-attractor


# build a new shiny app (from a template)
# use like `make shiny app=genius`
shiny:
	mkdir shiny/apps/${app}
	cp shiny/template/* shiny/apps/${app}
	
	
	
flask-images:
	docker build -t kdgosik/apps:flask
	docker build -t kdgosik/apps:flask-template flask/template
	
	
# build a new flask app (from a template)
# use like `make flask app=genius`
flask:
	mkdir flask/apps/${app}
	cp flask/template/* flask/apps/${app}
	
	
	
go-images:
	docker build -t kdgosik/apps:goapp
	docker build -t kdgosik/apps:goapp-template goapp/template
	
# build a new go app (from a template)
# use like `make goapp app=genius`
goapp:
	mkdir goapp/apps/${app}
	cp goapp/template/* goapp/apps/${app}	



node-images:
	docker build -t kdgosik/apps:node-images
	docker build -t kdgosik/apps:node-template node/template
	
# build a new go app (from a template)
# use like `make goapp app=genius`
node:
	mkdir node/apps/${app}
	cp node/template/* node/apps/${app}	





# publish all the images!
# TODO: will this automatically push all tags?
push:
	docker push kdgosik/apps

# pull down all the images
# http://www.googlinux.com/list-all-tags-of-docker-image/index.html
pull:
	curl 'https://registry.hub.docker.com/v2/repositories/kdgosik/apps/tags/' | jq '."results"[]["name"]' | xargs -I {} echo kdgosik/apps:{} | xargs -L1 sudo docker pull
	
readme:
	Rscript -e 'knitr::knit("README.Rmd")'
