FROM node:20.12-alpine

RUN addgroup app && adduser -S -G app app

USER root

WORKDIR /app

RUN mkdir data

COPY package*.json ./

RUN npm install --no-cache

COPY . .

RUN chown -R app:app /app

USER app

ENV API_URL=http://api.myapp.com/

EXPOSE 5173

CMD ["npm", "run", "dev"]
