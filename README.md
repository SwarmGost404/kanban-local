# stard in Docker

- start on [this]{http://localhost:4040}
- open source
- 

## First start
```bash
git clone https://github.com/SwarmGost404/kanban-local.git
cd kanban-local
sudo docker build -t vue-kanban .
sudo docker run -d -p 4040:4040 --name vue-kanban --restart unless-stopped vue-kanban
```

## start

```bash
sudo docker build -t vue-kanban .
sudo docker run -d -p 4040:4040 --name vue-kanban --restart unless-stopped vue-kanban
```

## stop 

```bash
sudo docker stop vue-kanban
```

## restart

```bash 
sudo docker restart vue-kanban
```