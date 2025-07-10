FROM node:20

RUN corepack enable

WORKDIR /app

COPY package.json ./
COPY pnpm-lock.yaml ./

RUN corepack prepare pnpm@10.12.1 --activate
RUN pnpm install --frozen-lockfile

COPY . .

RUN pnpm run build

EXPOSE 5678

CMD ["pnpm", "run", "start"]
