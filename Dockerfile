# Stage 1 - Build
FROM node:18 AS builder
WORKDIR /app
COPY app/ .
RUN npm install

# Stage 2 - Production (lighter image)
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app .
EXPOSE 3000
CMD ["npm", "start"]
