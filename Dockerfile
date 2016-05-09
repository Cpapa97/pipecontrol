FROM at-docker:5000/pipeline:latest

MAINTAINER Fabian Sinz <sinz@bcm.com>

WORKDIR /server/

# get fabee schemata
RUN \
  git clone https://github.com/fabiansinz/fabee.git && \
  git clone https://github.com/fabiansinz/commons.git && \
  pip install -e commons/python && \
  pip install -e fabee 

# Install rowbot
COPY . /server/rowbot

RUN \
  pip install -r rowbot/requirements.txt

WORKDIR /server/rowbot

    ENTRYPOINT python3 manage.py runserver



  
