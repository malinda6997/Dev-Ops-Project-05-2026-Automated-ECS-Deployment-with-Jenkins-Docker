# Step 1: Build the Vite App
FROM node:20-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Step 2: Serve the App using Nginx
FROM nginx:stable-alpine
# Vite build output goes to 'dist' folder
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]