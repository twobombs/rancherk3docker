FROM cruizba/ubuntu-dind

RUN apt update && apt -y upgrade && apt clean all 
RUN export DEBIAN_FRONTEND=noninteractive && apt update && apt install -y docker-buildx git coreutils pciutils screen glances curl

COPY run-rancher.sh run-rancher.sh
RUN chmod 755 run-rancher.sh
