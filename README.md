
<!-- README.md is generated from README.Rmd. Please edit that file -->
My web applications <img src="http://logo-logos.com/wp-content/uploads/2016/10/Docker_logo_logotype.png" width=100 align="right" /> <img src="https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png" width=100 align="right" /> <img src="http://www.unixstickers.com/image/cache/data/stickers/flask/Flask-text.sh-180x180.png" width=100 align="right" />
==================================================================================================================================================================================================================================================================================================================================================================

This repo contains code for building and deploying [web applications](https://en.wikipedia.org/wiki/Web_application) (e.g. [shiny](https://cran.r-project.org/package=shiny), [fiery](https://cran.r-project.org/package=fiery), and [flask](http://flask.pocoo.org/)) that I've developed for public consumption.

Run an app (as a docker container)
----------------------------------

Each app has it's own [Docker](https://www.docker.com/) container, as well as a [image tag on DockerHub](https://hub.docker.com/r/cpsievert/apps/builds/), so you can easily run apps on your local machine; for example, this will run the [zikar (shiny) app](https://github.com/cpsievert/apps/tree/master/shiny/apps/zikar) on <http://localhost:3838>

``` shell
docker run -p 3838:3838 cpsievert/apps:shiny-zikar
```

If you'd like to run a particular app in this repo, you can get the relevant image tag from the [`application.yml`](https://github.com/cpsievert/apps/blob/master/application.yml) file.

Acquire all the app images
--------------------------

To run all the applications, you'll need to pull (or build) all the corresponding docker images. A necessary first step is to pull (or build) the corresponding docker images. Either way, I'd suggest cloning this repo:

``` shell
git clone https://github.com/cpsievert/apps.git
cd apps
```

Now you can run the `make` command to *build* all the images or `make pull` to pull them from [my registry](https://hub.docker.com/r/cpsievert/apps/).

Run all the apps via shinyproxy
-------------------------------

The [`application.yml`](https://github.com/cpsievert/apps/blob/master/application.yml) can be used/modified to (securely) run all the applications as a service via [shinyproxy](https://www.shinyproxy.io/). See my blog post (coming soon).

``` shell
wget https://www.shinyproxy.io/downloads/shinyproxy-1.0.1.jar
java -jar shinyproxy-1.0.1.jar
```

Contributing
------------

Some guidelines for adding new apps:

### shiny

-   Run `make shiny app=my-app` (replacing `my-app` with a suitable name).
-   Place your shiny app under the new `shiny/apps/my-app` directory.
-   Ensure the Dockerfile has the right system/R requirements (`rsconnect::appDependencies()` can be helpful during this step).
-   Add `docker build -t cpsievert/apps:shiny-my-app shiny/apps/my-app` to the [Makefile](https://github.com/cpsievert/apps/blob/96aa5dcf/Makefile#L3)
-   Under [apps](https://github.com/cpsievert/apps/blob/96aa5dcf/application.yml#L16) in the `application.yml` file, add your app's name, description, etc.
