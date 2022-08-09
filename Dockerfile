# Dockerfile

FROM node:18.7.0-slim

RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN adduser --system --group app

# copy app source to image
COPY . /opt/app

# Install dependencies
RUN chown -R app /opt/app

# Install dependencies
npm install

USER app
EXPOSE 3000

CMD [ "npm", "run", "dev" ]