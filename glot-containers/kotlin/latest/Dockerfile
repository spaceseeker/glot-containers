FROM supermina999/alpine-kotlin:latest
MAINTAINER Petter Rasmussen "nishtahir@outlook.com"

# Add user
RUN addgroup glot
RUN adduser -h /home/glot -D -G glot -s /bin/bash glot

# Install code-runner
ADD https://github.com/spaceseeker/slidenerd-glot-run/releases/download/0.1/slidenerd-glot-run /home/glot/runner
RUN chmod +x /home/glot/runner

USER glot
WORKDIR /home/glot/
CMD ["/home/glot/runner"]
ENTRYPOINT "/home/glot/runner"
