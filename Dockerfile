FROM taf7lwappqystqp4u7wjsqkdc7dquw/needlessbeta
MAINTAINER “Emory Merryman” emory.merryman+DoTDeCocXJroqaWu@gmail.com>
RUN dnf update --assumeyes && dnf install --assumeyes git dbus && dnf update --assumeyes && dnf clean all && mkdir /root/.ssh && chmod 0700 /root/.ssh && dbus-uuidgen > /var/lib/dbus/machine-id 
COPY config /root/.ssh/config
COPY angrybeta.sh /usr/local/sbin/angrybeta
COPY angrybeta.service /usr/lib/systemd/system/angrybeta.service
COPY angrybeta.timer /usr/lib/systemd/system/angrybeta.timer
RUN  chmod 0500 /usr/local/sbin/angrybeta && systemctl enable angrybeta.timer && chmod 0600 /root/.ssh/config
VOLUME /var/private
VOLUME /srv
CMD ["/usr/sbin/init"]
