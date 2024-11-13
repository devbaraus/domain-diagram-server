FROM oven/bun:1 AS builder

RUN apt-get update -y && apt-get install -y openssl

RUN bun add -g prisma

WORKDIR /app

COPY . .

RUN bun install --frozen-lockfile --production

RUN bunx prisma generate

EXPOSE 3000

CMD ["bun", "run", "start"]