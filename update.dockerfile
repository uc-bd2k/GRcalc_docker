
FROM ucbd2k/grcalculator-docker:local2021_base

RUN R -e "remotes::install_github('uc-bd2k/GRmetrics', dependencies = F, ref = 'update')"
RUN R -e "remotes::install_github('uc-bd2k/shinyLi', dependencies = F)"

### clone only the "update" branch for GRcalculator repositories
RUN git clone -b update --single-branch https://github.com/uc-bd2k/grcalculator.git
RUN git clone -b update --single-branch https://github.com/uc-bd2k/grbrowser.git
RUN git clone -b update --single-branch https://github.com/uc-bd2k/grtutorial.git

RUN mv grcalculator /srv/shiny-server
RUN mv grbrowser /srv/shiny-server
RUN mv grtutorial /srv/shiny-server