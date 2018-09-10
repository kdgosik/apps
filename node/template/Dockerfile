FROM kdgosik/apps:node
WORKDIR /app
COPY package.json /app/package.json
RUN npm install --production
COPY app.js /app/app.js
EXPOSE 3000
CMD npm start
