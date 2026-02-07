# stard in Docker

## First start
```bash
git clone https://github.com/SwarmGost404/kanban-local.git
cd kanban-local
docker build -t vue-kanban .
docker run -d -p 8080:80 --name vue-kanban --restart unless-stopped vue-kanban
```

-

## start

```bash
docker build -t vue-kanban .
docker run -d -p 8080:80 --name vue-kanban --restart unless-stopped vue-kanban
```

- 

## stop 

```bash
docker stop vue-kanban
```

-

## restart

```bash 
docker restart vue-kanban
```