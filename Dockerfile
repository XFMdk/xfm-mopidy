FROM ubuntu

MAINTAINER Martin Djurhuus <mld@xfm.dk>

#Updating the system
RUN apt-get update
RUN apt-get upgrade -y

#Installing nessive packets
RUN apt-get install -y curl
RUN apt-get install -y sudo
RUN apt-get install -y gnupg
RUN apt-get install -y python-pip

#Adding keys to download liste
RUN curl --silent http://apt.mopidy.com/mopidy.gpg | sudo apt-key add -
RUN curl --silent http://apt.mopidy.com/mopidy.list > /etc/apt/sources.list.d/mopidy.list
RUN apt-get update

#Installing Mopidy
RUN apt-get -y install mopidy

#Installing Addons
RUN apt-get -y install mopidy-spotify #For Spotify playback

#Installing webclients
RUN pip install mopidy-musicbox-webclient
RUN pip install Mopidy-Moped
RUN pip install Mopidy-Mopify

#Clearn up
Run apt-get clean

#Moving configs files
ADD mopidy.conf /root/.config/mopidy/mopidy.conf
ADD mopidy.conf /etc/mopidy/mopidy.conf

EXPOSE 6680 6600

#Run Mopidy
CMD mopidy
