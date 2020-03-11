FROM 190472737949.dkr.ecr.us-east-1.amazonaws.com/base-image

WORKDIR /usr/src/app
COPY package.json .
COPY . .
COPY node_modules node_modules
RUN npm install

EXPOSE 8080
CMD [ "npm", "start" ]

#COPY . .

