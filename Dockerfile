# Use the official Node.js image as the base image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Create a simple Node.js app
RUN echo "const http = require('http'); \
const hostname = '0.0.0.0'; \
const port = 3000; \
const server = http.createServer((req, res) => { \
  res.statusCode = 200; \
  res.setHeader('Content-Type', 'text/plain'); \
  res.end('Hello World\\n'); \
}); \
server.listen(port, hostname, () => { \
  console.log('Server running at http://' + hostname + ':' + port); \
});" > index.js

# Install node dependencies (if any)
RUN npm init -y

# Expose the app port
EXPOSE 3000

# Start the Node.js app
CMD ["node", "index.js"]

