FROM xmjandrews/verse:20.07.15

RUN Rscript -e 'devtools::install_version("locfit", version = "1.5-9.4", repos = "http://cran.r-project.org")'

# Install extra packages not installed in xmjandrews/verse
RUN install2.r --error microbenchmark \
                       zoo \
                       cowplot \
                       latex2exp \
                       magrittr \
                       modelr \
                       carData \
                       fivethirtyeight \
                       ggExtra \
                       ggrepel \
                       timetk \
                       aplpack \
                       psych \
                       moments \
                       sloop \
                       kableExtra \
                       reticulate \
                       ellipse \
                       WWGbook \
                       tikzDevice\
                       lavaan \
                       GGally \
                       pscl \
                       mixtools \
                       sparklyr \
                       Ecdat \
                       tidybayes \
                       learnr
                       
                       

RUN rm -rf /tmp/downloaded_packages /tmp/*.rds

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	      zsh \
	      vim \
	      python3-pygments \
        libglpk-dev libglpk40 \
        texlive-xetex \
        texlive-plain-generic \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        libopenmpi-dev \
        libzmq3-dev \
        ghostscript \
        libtcl8.6 \
        libtk8.6 \
        virtualenv \
        openjdk-8-jdk
        
# I don't think this worked?
RUN Rscript -e "sparklyr::spark_install()"

# Why exactly this is needed is not clear, but I get an error as described at https://www.mail-archive.com/rcpp-devel@lists.r-forge.r-project.org/msg10226.html 
# that seems to be solved when I do an all packages update.
RUN Rscript -e 'install.packages(c("arrow", "backports", "bayesplot", "BH", "BiocManager", "bit", "bit64", "blob", "brew", "bridgesampling", "brms", "Brobdingnag", "broom", "callr", "checkmate", "clipr", "coda", "colorspace", "colourpicker", "commonmark", "covr", "crayon", "credentials", "crosstalk", "curl", "data.table", "DBI", "desc", "devtools", "digest", "DT", "dtplyr", "evaluate", "fansi", "farver", "fastmap", "forcats", "fs", "fst", "gert", "ggridges", "gh", "git2r", "gtools", "haven", "highr", "hms", "htmltools", "httpuv", "httr", "igraph", "inline", "isoband", "jsonlite", "knitr", "labeling", "Lahman", "later", "littler", "lme4", "loo", "matrixStats", "memoise", "mgcv", "mime", "mvtnorm", "nloptr", "nycflights13", "openssl", "packrat", "pkgbuild", "pkgload", "plyr", "processx", "promises", "ps", "R6", "rcmdcheck", "RColorBrewer", "Rcpp", "RcppEigen", "RcppParallel", "readr", "readxl", "remotes", "reprex", "rex", "rlang", "RMariaDB", "rmarkdown", "roxygen2", "RPostgres", "rsconnect", "RSQLite", "rstan", "rstantools", "rstudioapi", "rversions", "rvest", "scales", "sessioninfo", "shiny", "shinyjs", "shinystan", "shinythemes", "StanHeaders", "statmod", "stringi", "sys", "testthat", "tidyverse", "tinytex", "usethis", "utf8", "V8", "viridisLite", "vroom", "withr", "xfun", "xml2", "xts", "yaml"))'
