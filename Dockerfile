FROM node:18

# Enable Corepack (needed for pnpm/yarn workspaces)
RUN corepack enable

# Set correct version of pnpm
RUN corepack prepare pnpm@8.15.5 --activate

# Create app directory
WORKDIR /app

# Copy dependency files
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy rest of the files
COPY . .

# Expose default n8n port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "start"]
