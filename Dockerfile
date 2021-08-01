FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build
# will output to /app/build

#get output for nginx, default nginx container will start nginx
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html
