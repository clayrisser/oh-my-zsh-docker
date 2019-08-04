FROM alpine:3.9.2

LABEL image=codejamninja/oh-my-zsh:latest \
  maintainer="Jam Risser <jam@codejam.ninja>" \
  base=alpine:3.9.2

RUN apk add --no-cache \
  curl \
  git \
  openssh \
  unzip \
  vim \
  zip \
  zsh
RUN wget -O /usr/local/bin/confd \
  https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 && \
  chmod +x /usr/local/bin/confd

COPY entrypoint.sh /usr/local/sbin/entrypoint.sh
COPY sshd.toml /etc/confd/conf.d/sshd.toml
COPY sshd_config.tmpl /etc/confd/templates/sshd_config.tmpl

RUN chmod +x /usr/local/sbin/entrypoint.sh && \
  echo "root:root" | chpasswd && \
  ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key && \
  ssh-keygen -A

WORKDIR /root

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
  git clone https://github.com/denysdovhan/spaceship-prompt.git /root/.oh-my-zsh/custom/themes/spaceship-prompt && \
  ln -s /root/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme /root/.oh-my-zsh/custom/themes/spaceship.zsh-theme && \
  sed -ir 's#root:x:0:0:root:/root:/bin/ash#root:x:0:0:root:/root:/bin/zsh#' /etc/passwd

COPY _zshrc /root/.zshrc

ENV PORT=22

ENTRYPOINT ["sh", "-c", "/usr/local/sbin/entrypoint.sh"]
