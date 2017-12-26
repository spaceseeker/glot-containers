FROM node:latest
MAINTAINER Petter Rasmussen "petter.rasmussen@gmail.com"

# Set locale
ENV LANG C.UTF-8

# Add user
RUN groupadd glot
RUN useradd -m -d /home/glot -g glot -s /bin/bash glot

# Install elm
RUN npm install elm

# Bootstrap an elm app
RUN mkdir /bootstrap && \
    cd /bootstrap && \
    npm install jsdom && \
    /node_modules/elm/Elm-Platform/0.18.0/.cabal-sandbox/bin/elm-package install -y elm-lang/html && \
    /node_modules/elm/Elm-Platform/0.18.0/.cabal-sandbox/bin/elm-package install -y elm-lang/svg && \
    /node_modules/elm/Elm-Platform/0.18.0/.cabal-sandbox/bin/elm-package install -y evancz/elm-markdown && \
    /node_modules/elm/Elm-Platform/0.18.0/.cabal-sandbox/bin/elm-package install -y elm-community/list-extra && \
    /node_modules/elm/Elm-Platform/0.18.0/.cabal-sandbox/bin/elm-package install -y elm-community/maybe-extra && \
    /node_modules/elm/Elm-Platform/0.18.0/.cabal-sandbox/bin/elm-make --yes


# Install code-runner
ADD https://github.com/spaceseeker/slidenerd-glot-run/releases/download/0.1/slidenerd-glot-run /home/glot/runner
RUN chmod +x /home/glot/runner

# Copy files
COPY files/app.js /bootstrap/

RUN chown glot:glot -R /bootstrap
RUN chown glot:glot -R /node_modules

USER glot
WORKDIR /home/glot/
CMD ["/home/glot/runner"]
ENTRYPOINT export PATH="/node_modules/elm/Elm-Platform/0.18.0/.cabal-sandbox/bin:$PATH" && "/home/glot/runner"
