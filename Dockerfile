# Multi‑stage Dockerfile placeholder
FROM node:18-alpine AS builder
WORKDIR /app
COPY . .
RUN npm ci && npm run build
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
EXPOSE 8088
CMD ["node", "dist/server.js"]