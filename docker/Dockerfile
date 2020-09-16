FROM xmjandrews/verse:20.07.15

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
        libopenmpi-dev \
        libzmq3-dev \
        ghostscript \
        libtcl8.6 \
        libtk8.6 \
        virtualenv \
        openjdk-8-jdk
        
# I don't think this worked?
RUN Rscript -e "sparklyr::spark_install()"

