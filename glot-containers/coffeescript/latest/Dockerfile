FROM node:latest
MAINTAINER Petter Rasmussen "petter.rasmussen@gmail.com"

RUN npm install -g coffee-script

# Add user
RUN groupadd glot
RUN useradd -m -d /home/glot -g glot -s /bin/bash glot

# Install code-runner
ADD https://github.com/spaceseeker/slidenerd-glot-run/releases/download/0.1/slidenerd-glot-run /home/glot/runner
RUN chmod +x /home/glot/runner

USER glot
WORKDIR /home/glot/
CMD ["/home/glot/runner"]
ENTRYPOINT "/home/glot/runner"
