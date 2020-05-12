FROM node:12.16-stretch
WORKDIR /app
COPY package.json ./package.json
RUN npm i
RUN adduser app --disabled-password
COPY --chown=app:app . ./
USER app
EXPOSE 3000
CMD ["npm", "start"]
