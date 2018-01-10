FROM resin/raspberry-pi-node:onbuild

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN DEBIAN_FRONTEND=noninteractive JOBS=MAX npm install --unsafe-perm
ONBUILD COPY . /usr/src/app

COPY package.json package.json

RUN npm install

COPY . .

EXPOSE 3000:3000

CMD ["npm", "start"]
