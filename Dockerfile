FROM fedora:39

COPY ./ms-windows/mingw/mingwdeps.sh /QGIS/ms-windows/mingw/mingwdeps.sh
RUN /QGIS/ms-windows/mingw/mingwdeps.sh

RUN dnf install -y which

# install nvm
# https://stackoverflow.com/a/57546198
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
ENV NVM_DIR=/root/.nvm
ENV NODE_VERSION=17.9.1
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

## enalble `yarn` to be available in PATH
RUN corepack enable

# is this some hardcoded path? why `yarn` is not deteceted?
RUN ln -s "$(which yarn)" /usr/local/bin/yarn


# allows compile repository at specific path
RUN git config --global --add safe.directory /QGIS

WORKDIR /QGIS
