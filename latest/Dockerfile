FROM alpine:3.9.2

LABEL image=codejamninja/oh-my-zsh:latest \
  maintainer="Jam Risser <jam@codejam.ninja>" \
  base=alpine:3.9.2

RUN apk add --no-cache \
  curl \
  git \
  openrc \
  openssh \
  unzip \
  vim \
  zip \
  zsh
RUN wget -O /usr/local/bin/confd \
  https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 && \
  chmod +x /usr/local/bin/confd

COPY entrypoint.sh /usr/local/sbin/entrypoint.sh
COPY sshd_config.tmpl /etc/confd/templates/sshd_config.tmpl
COPY sshd_config.toml /etc/confd/conf.d/sshd_config.toml

RUN rc-update add sshd && \
  chmod +x /usr/local/sbin/entrypoint.sh && \
  adduser -D -s /sbin/nologin bastion && \
  passwd -u -d bastion && \
  ssh-keygen -A && \
  mkdir /home/bastion/.ssh && \
  chown -R bastion:bastion /home/bastion/.ssh && \
  chmod -R 0700 /home/bastion/.ssh && \
  touch /home/bastion/.ssh/authorized_keys && \
  chmod 0640 /home/bastion/.ssh/authorized_keys

WORKDIR /home/bastion

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
  git clone https://github.com/denysdovhan/spaceship-prompt.git /root/.oh-my-zsh/custom/themes/spaceship-prompt && \
  ln -s /root/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme /root/.oh-my-zsh/custom/themes/spaceship.zsh-theme && \
  git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

COPY _zshrc /root/.zshrc

ENTRYPOINT ["/bin/zsh"]
