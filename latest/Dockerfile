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

COPY entrypoint.sh /usr/local/sbin/entrypoint.sh

RUN chmod +x /usr/local/sbin/entrypoint.sh

WORKDIR /root

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
  git clone https://github.com/denysdovhan/spaceship-prompt.git /root/.oh-my-zsh/custom/themes/spaceship-prompt && \
  ln -s /root/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme /root/.oh-my-zsh/custom/themes/spaceship.zsh-theme

COPY _zshrc /root/.zshrc

ENTRYPOINT ["sh", "-c", "/usr/local/sbin/entrypoint.sh"]
