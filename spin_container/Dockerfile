FROM ubuntu

RUN apt-get update && apt-get install -y \
curl git && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /spin_container/

WORKDIR /spin_container

RUN chmod 755 /spin_container/*.sh
