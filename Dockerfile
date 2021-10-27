FROM rocker/verse
MAINTAINER Eric Zhang <eyzhang@unc.edu>
RUN R -e "install.packages(c('ggplot2', 'readr', 'tidyverse', 'gridExtra', 'shiny', 'data.table', 'DT', 'ggfortify'))"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN adduser rstudio sudo
RUN apt update -y && apt install -y        ne        sqlite3texlive-basetexlive-binaries        texlive-latex-basetexlive-latex-recommendedtexlive-pictures        texlive-latex-extrapython3-pip
