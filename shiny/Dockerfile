FROM rocker/r-ver:latest
MAINTAINER Kirk Gosik "kdgosik@gmail.com"

# ---------------------------------------------------------------------------
# Install some (additional) system/R dependencies, that most, if not all
# of the apps in this repo will utilize
# ---------------------------------------------------------------------------

RUN apt-get update && apt-get install -y \
    sudo \
    software-properties-common \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev

RUN R -e "update.packages(ask=F); install.packages(c('shiny', 'remotes', 'curl'))"

# (openanalytics overwrites existing Rprofile.site, which is bad practice)
# https://github.com/openanalytics/shinyproxy-demo/blob/373460/Dockerfile#L25
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), shiny.host = '0.0.0.0', shiny.port = 3838)" >> /usr/local/lib/R/etc/Rprofile.site

EXPOSE 3838

CMD R -e "shiny::runExample('01_hello')"
