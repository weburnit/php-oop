FROM python:3.4

MAINTAINER Valentin Kaminskiy "valentin.kaminskiy@lazada.com"

RUN apt-get update

# Install software
RUN apt-get install -y git

# Install telnet
RUN apt-get install telnet

# Make ssh dir
RUN mkdir /root/.ssh/

# Copy over private key, and set permissions
ADD id_rsa /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts

# Add bitbuckets key
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

WORKDIR /root

# Clone the conf files into the docker container
RUN git clone git@bitbucket.org:super-ops-team/oms-qaa.git

WORKDIR /root/oms-qaa

RUN git pull

RUN git checkout origin/OPSQA-37_Make_apiadapter_tests_infrastructure_runable_in_one_compose_file

RUN pip install -v -r requirements.txt

RUN /root/oms-qaa/api_adapter/bootstrap.sh

CMD /bin/bash /root/oms-qaa/run_all.sh