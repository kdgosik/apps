---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Web applications <img src="http://logo-logos.com/wp-content/uploads/2016/10/Docker_logo_logotype.png" width=100 align="right" /> <img src="https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png" width=100 align="right" /> <img src="http://flask.pocoo.org/static/logo/flask.png" width=100 align="right" /> 

This repo contains code for building and deploying [web applications](https://en.wikipedia.org/wiki/Web_application) (e.g. [shiny](https://cran.r-project.org/package=shiny),
[flask](http://flask.pocoo.org/), 
[Go](https://golang.org/doc/articles/wiki/) and
[node](https://medium.com/@adnanrahic/hello-world-app-with-node-js-and-express-c1eb7cfa8a30))

This repo is heavily borrowed from [here](https://github.com/cpsievert/apps) and adapted for apps that I have created.  

## Run an app (as a docker container)

Each app has it's own [Docker](https://www.docker.com/) container, as well as a [image tag on DockerHub](https://hub.docker.com/r/kdgosik/apps/builds/), so you can easily run apps on your local machine; for example, this will run the [clifford-attractor (shiny) app](https://github.com/kdgosik/apps/tree/master/shiny/apps/clifford-attractor) on <http://localhost:3838>

### shiny
```shell
docker run -p 3838:3838 kdgosik/apps:shiny-clifford-attractor
```


### flask
```shell
docker run -p 3000:80 kdgosik/apps:flask-static-example
```


### go
```shell
docker run -p 8080:8080 kdgosik/apps:goapp-static-example
```


### node
```shell
docker run -p 3000:3000 kdgosik/apps:node-static-example
```

If you'd like to run a particular app in this repo, you can get the relevant image tag from the [`application.yml`](https://github.com/kdgosik/apps/blob/master/application.yml) file.

## Acquire all the app images

To run all the applications, you'll need to pull (or build) all the corresponding docker images. A necessary first step is to pull (or build) the corresponding docker images. Either way, I'd suggest cloning this repo:

```shell
git clone https://github.com/kdgosik/apps.git
cd apps
```

Now you can run the `make` command to *build* all the images or `make pull` to pull them from [my registry](https://hub.docker.com/r/kdgosik/apps/).

## Run all the apps via shinyproxy

The [`application.yml`](https://github.com/cpsievert/apps/blob/master/application.yml) can be used/modified to (securely) run all the applications as a service via [shinyproxy](https://www.shinyproxy.io/). See the blog post by the original creator (coming soon).

```shell
wget https://www.shinyproxy.io/downloads/shinyproxy-1.0.1.jar
java -jar shinyproxy-1.0.1.jar
```

## Contributing

Some guidelines for adding new apps:

### shiny

* Run `make shiny app=my-app` (replacing `my-app` with a suitable name).
* Place your shiny app under the new `shiny/apps/my-app` directory.
* Update install.R file to reflect the necessary packages for R to install.
* Add `docker build -t kdgosik/apps:shiny-my-app shiny/apps/my-app` to the [Makefile](https://github.com/kdgosik/apps/blob/Makefile)
* Under [apps](https://github.com/kdgosik/apps/blob/master/application.yml) in the `application.yml` file, add your app's name, description, etc.


### flask

* Run `make flask app=my-app` (replacing `my-app` with a suitable name).
* Place your flask app under the new `flask/apps/my-app` directory.
* Update requirements.txt file to reflect the necessary python modules to install.
* Add `docker build -t kdgosik/apps:flask-my-app flask/apps/my-app` to the [Makefile](https://github.com/kdgosik/apps/blob/Makefile)
* Under [apps](https://github.com/kdgosik/apps/blob/master/application.yml) in the `application.yml` file, add your app's name, description, etc.


### go

* Run `make goapp app=my-app` (replacing `my-app` with a suitable name).
* Place your go app under the new `goapp/apps/my-app` directory.
* Update requirements.txt file to reflect the necessary python modules to install.
* Add `docker build -t kdgosik/apps:goapp-my-app goapp/apps/my-app` to the [Makefile](https://github.com/kdgosik/apps/blob/Makefile)
* Under [apps](https://github.com/kdgosik/apps/blob/master/application.yml) in the `application.yml` file, add your app's name, description, etc.


### node

* Run `make node app=my-app` (replacing `my-app` with a suitable name).
* Place your node app under the new `node/apps/my-app` directory.
* Update package.json file to reflect the necessary python modules to install.
* Add `docker build -t kdgosik/apps:node-my-app node/apps/my-app` to the [Makefile](https://github.com/kdgosik/apps/blob/Makefile)
* Under [apps](https://github.com/kdgosik/apps/blob/master/application.yml) in the `application.yml` file, add your app's name, description, etc.
