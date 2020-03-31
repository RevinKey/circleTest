# use base node image
FROM node:10.16.1 AS builder
WORKDIR /src
# copy all files from localhost into the docker container
COPY . .
# install deps
RUN npm install

## Install shush
RUN curl -sL -o /usr/local/bin/shush \
  https://github.com/realestate-com-au/shush/releases/download/v1.3.0/shush_linux_amd64 \
  && chmod +x /usr/local/bin/shush

FROM node:10.16.1

COPY --from=builder /src /src
COPY --from=builder /usr/local/bin/shush /usr/local/bin

# expose port
EXPOSE 4000

## Use shush exec as an entrypoint for decrypting our secrets
ENTRYPOINT ["shush", "--region=us-east-1", "exec", "--"]

# run server
CMD ["node", "/src/server.js"]
