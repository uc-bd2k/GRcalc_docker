FROM ucbd2k/grcalculator-docker:base

RUN R -e "remotes::install_github('uc-bd2k/GRmetrics', dependencies = F)"
RUN R -e "remotes::install_github('uc-bd2k/shinyLi', dependencies = F)"

RUN git clone https://github.com/uc-bd2k/grcalculator.git
RUN git clone https://github.com/uc-bd2k/grbrowser.git
RUN git clone https://github.com/uc-bd2k/grtutorial.git

RUN mv grcalculator /srv/shiny-server
RUN mv grbrowser /srv/shiny-server
RUN mv grtutorial /srv/shiny-server
