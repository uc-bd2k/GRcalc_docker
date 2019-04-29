FROM ucbd2k/grcalculator-docker:test_base

RUN R -e "install.packages('tictoc')"
RUN R -e "remotes::install_github('uc-bd2k/GRmetrics', dependencies = F, ref = 'update')"
RUN R -e "remotes::install_github('uc-bd2k/shinyLi', dependencies = F)"

RUN R -e "install.packages('BiocManager', repos = 'https://mran.microsoft.com/snapshot/2019-02-12')"
RUN R -e "BiocManager::install('SummarizedExperiment')"

RUN git clone https://github.com/uc-bd2k/grcalculator.git
RUN git clone https://github.com/uc-bd2k/grbrowser.git
RUN git clone https://github.com/uc-bd2k/grtutorial.git

RUN cd grcalculator && git checkout update && cd ..

RUN mv grcalculator /srv/shiny-server
RUN mv grbrowser /srv/shiny-server
RUN mv grtutorial /srv/shiny-server
