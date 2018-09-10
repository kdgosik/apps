FROM kdgosik/apps:shiny
MAINTAINER Kirk Gosik "kdgosik@gmail.com"

# copy the app to the image
COPY ./ ./

## install necessary R packages
RUN Rscript install.R

CMD R -e 'shiny::runApp()'
