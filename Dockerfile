#Use the node:10-alpine image as a base to
FROM node:10-alpine

#create a directory for the app and its node_modules with node as its owner
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

# COPY ["package.json", "package-lock.json*", "./"]

COPY package*.json ./

#install all packages in package.json
USER node

RUN npm i

COPY --chown=node:node . .

#expose port 8080 and run the app
EXPOSE 8080

CMD ["node", "app.js"]

#the docker lecture will help you complete this file 
#there should be a total of 9 lines
