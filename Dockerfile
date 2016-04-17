FROM benningm/puppet-base:latest
MAINTAINER Markus Benning <ich@markusbenning.de>

ADD Puppetfile /etc/puppet/Puppetfile
RUN cd /etc/puppet && librarian-puppet install --verbose

ADD manifest.pp /etc/puppet/manifests/docker_bamberg.pp
RUN /usr/local/bin/puppet-apply-wrapper /etc/puppet/manifests

EXPOSE 80

