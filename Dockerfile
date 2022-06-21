FROM ubuntu:20.04
# update ubuntu
RUN set -e; \
    apt-get update && \
    apt-get install -qqy --no-install-recommends \
    curl wget nano gnupg2 software-properties-common;
# install gcloud 
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-cli -y
# set nodejs repository path
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
# install nodejs and remove apt list chunk
RUN set -e; \
    apt-get update && \
    apt-get install -qqy \
    nodejs && \
    rm -rf /var/lib/apt/lists;

#RUN node  -v
#RUN gcloud  -v

#command for create image  `docker build --tag <name of image>:<version> .`