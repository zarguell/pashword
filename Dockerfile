# Dockerfile

FROM node:18.7.0-slim

RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN adduser -S app

# install dependencies
COPY package.json ./
RUN npm cache clean --force && npm install

# copy app source to image _after_ npm install so that
# application code changes don't bust the docker cache of npm install step
COPY . /opt/app

#RUN npm install
RUN chown -R app /opt/app

USER app
EXPOSE 3000

CMD [ "npm", "run", "dev" ]