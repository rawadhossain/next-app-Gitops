FROM node:alpine

WORKDIR /app

# Copy only package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Now copy the rest of the project (excluding node_modules due to .dockerignore)
COPY . .

# Build the project
RUN npm run build

# Start the application
CMD ["npm", "run", "start"]
