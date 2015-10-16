FROM nginx:1.7
# Based off Shane Sveller <shane@bellycard.com> & https://github.com/bellycard/docker-loadbalancer
MAINTAINER Ben Hall <ben@benhall.me.uk>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get -y install curl runit && \
    rm -rf /var/lib/apt/lists/*

# Download https://github.com/hashicorp/consul-template
ENV CT_URL https://github.com/hashicorp/consul-template/releases/download/v0.1.0/consul-template_0.1.0_linux_amd64.tar.gz
RUN curl -L $CT_URL | tar -C /usr/local/bin --strip-components 1 -zxf -

# Define how services run & where consul lives
ADD nginx.service /etc/service/nginx/run
ADD consul-template.service /etc/service/consul-template/run

# Copy nginx.conf template. consul-template will use this to generate the
# config file dynamically
# It knows this based on consul-template.service
RUN rm -v /etc/nginx/conf.d/*
ADD nginx.conf /etc/consul-templates/nginx.conf

CMD ["/usr/bin/runsvdir", "/etc/service"]
