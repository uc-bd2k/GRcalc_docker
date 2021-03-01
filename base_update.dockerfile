FROM rocker/rstudio-stable:3.5.1

COPY shiny-server.conf /etc/shiny-server/

RUN apt-get update -qq && \
    apt-get install -y \
    pkg-config \
    procps \
    libnlopt-dev \
    libmariadb-client-lgpl-dev \
    zlib1g-dev \
    libssh2-1-dev \
    libxml2-dev \
    curl \
    libpng-dev \
    sudo \
    wget \
    nano \
    git \
    xclip

RUN export ADD=shiny && bash /etc/cont-init.d/add

### install updated rsconnect, etc.
RUN R -e "install.packages('rsconnect', repos = 'https://mran.microsoft.com/snapshot/2021-02-12')"
RUN R -e "install.packages('RJSONIO', repos = 'https://mran.microsoft.com/snapshot/2021-02-12')"
RUN R -e "install.packages('PKI', repos = 'https://mran.microsoft.com/snapshot/2021-02-12')"
### install version-controlled packages for the rest
RUN R -e "install.packages('readr', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('shiny', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('shinyjs', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('DT', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('formattable', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('plyr', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('shinyBS', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('markdown', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('remotes', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('htmltools', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('ggplot2', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('drc', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('plotly', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('ggsci', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('lemon', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('assertthat', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('dplyr', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('magrittr', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('purrr', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"

RUN R -e "install.packages('gridExtra', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('caTools', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('cowplot', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('shiny.semantic', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('shinycssloaders', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"

RUN R -e "install.packages('BiocManager', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "BiocManager::install('SummarizedExperiment')"
RUN R -e "install.packages('tictoc', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('rclipboard', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "install.packages('clipr', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
