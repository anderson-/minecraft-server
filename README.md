# mc-server

Paper Minecraft server with automatic plugin management, cracked mode, and [playit.gg](https://playit.gg) tunnel.

## Requirements

- Docker + Docker Compose
- A [playit.gg](https://playit.gg) account and secret key

## Setup

```bash
cp .env.example .env
# edit .env and paste your playit.gg secret key
```

## playit.gg

1. Create an account at [playit.gg](https://playit.gg)
2. Go to **Agents** → **Add Agent** → copy the secret key into your `.env`
3. Go to **Tunnels** → **Add Tunnel** → type: Minecraft Java → port: 25565
4. Copy the tunnel address (e.g. `something.mc.ply.gg`) — this is what your friends use to connect

## Usage

```bash
make up           # start server
make down         # stop and remove containers
make logs         # follow server logs
make console      # open server console
```

## Managing players

Run these inside `make console` (no leading slash needed):

```
whitelist on
whitelist add playername
whitelist remove playername
whitelist list
op playername
```

> Note: in offline mode, players must connect at least once before the server knows their UUID.
> Add them to the whitelist after their first connection attempt shows up in the logs.

## Connecting

1. Download [TLauncher](https://tlauncher.org) or any offline launcher
2. Pick a nickname
3. Multiplayer → Add Server → paste the tunnel address from playit.gg
4. Default port 25565

## Plugins

Installed automatically on first start:

- **WorldEdit** — bulk terrain editing
- **ViaVersion** — allows clients on different Minecraft versions to connect

## Data

Server data is stored in `./data/` and persists across restarts.
To reset the world, stop the server and delete `./data/world/`.
