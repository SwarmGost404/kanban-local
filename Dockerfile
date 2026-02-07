# Use a Node.js image for the development environment
FROM node:lts-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the default Vite development port (5173)
EXPOSE 5173

# Command to run the development server, listening on all network interfaces
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
