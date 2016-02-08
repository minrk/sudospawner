# example showing sudo config
# docker run -it -p 8000:8000 jupyter/jupyterhub-sudo

FROM jupyter/jupyterhub

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

RUN which sudo || (apt-get -y update && apt-get -y install sudo)

# add the rhea user, who will run the server
# she needs to be in the shadow group in order to access the PAM service
RUN useradd -m -G shadow -p $(openssl passwd -1 rhea) rhea

# Give rhea passwordless sudo access to run the sudospawner mediator on behalf of users:
ADD examples/sudoers /tmp/sudoers
RUN cat /tmp/sudoers >> /etc/sudoers
RUN rm /tmp/sudoers

# add some regular users
RUN for name in io ganymede; do useradd -m -p $(openssl passwd -1 $name) $name; done

# make home directories private
RUN chmod o-rwx /home/*

RUN python3 -m pip install notebook
ADD . /srv/sudospawn
WORKDIR /srv/sudospawn
RUN python3 -m pip install .

# make the working dir owned by rhea, so she can create the state database
RUN chown rhea .

USER rhea
RUN which jupyterhub-singleuser