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

WORKDIR /root

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
  git clone https://github.com/denysdovhan/spaceship-prompt.git /root/.oh-my-zsh/custom/themes/spaceship-prompt && \
  ln -s /root/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme /root/.oh-my-zsh/custom/themes/spaceship.zsh-theme && \
  git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

COPY ./_zshrc /root/.zshrc

ENTRYPOINT ["/bin/zsh"]
