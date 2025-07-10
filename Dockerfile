FROM node:18

RUN corepack enable
RUN corepack prepare pnpm@8.15.5 --activate

# Tell pnpm to ignore catalog for overrides
ENV PNPM_OVERRIDE_IGNORE_CATALOG=1

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN pnpm install

COPY . .

EXPOSE 5678

CMD ["pnpm", "start"]
