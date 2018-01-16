FROM rocker/rstudio-stable:3.4.0

COPY shiny-server.conf /etc/shiny-server/

RUN apt-get update -qq && \
    apt-get install -y \
    pkg-config \
    libnlopt-dev \
    libmariadb-client-lgpl-dev \
    zlib1g-dev \
    libssh2-1-dev \
    libxml2-dev \
    curl \
    libpng-dev \
    sudo \
    wget \
    git
    
RUN export ADD=shiny && bash /etc/cont-init.d/add

RUN R -e "source('https://bioconductor.org/biocLite.R'); biocLite('GRmetrics', ask=FALSE, siteRepos='https://mran.microsoft.com/snapshot/2017-11-01');"

RUN R -e "install.packages('readr', repos = 'https://mran.microsoft.com/snapshot/2017-11-01')"
RUN R -e "install.packages('shiny', repos = 'https://mran.microsoft.com/snapshot/2017-11-01')"
RUN R -e "install.packages('shinyjs', repos = 'https://mran.microsoft.com/snapshot/2017-11-01')"
RUN R -e "install.packages('DT', repos = 'https://mran.microsoft.com/snapshot/2017-11-01')"
RUN R -e "install.packages('formattable', repos = 'https://mran.microsoft.com/snapshot/2017-11-01')"
RUN R -e "install.packages('plyr', repos = 'https://mran.microsoft.com/snapshot/2017-11-01')"
RUN R -e "install.packages('shinyBS', repos = 'https://mran.microsoft.com/snapshot/2017-11-01')"
RUN R -e "install.packages('markdown', repos = 'https://mran.microsoft.com/snapshot/2017-11-01')"
RUN R -e "install.packages('ghit', repos = 'https://mran.microsoft.com/snapshot/2017-11-01')"

RUN R -e "ghit::install_github('uc-bd2k/shinyLi')"

RUN git clone https://github.com/uc-bd2k/grcalculator.git
RUN git clone https://github.com/uc-bd2k/grbrowser.git
RUN git clone https://github.com/uc-bd2k/grtutorial.git

RUN mv grcalculator /srv/shiny-server
RUN mv grbrowser /srv/shiny-server
RUN mv grtutorial /srv/shiny-server
