# stard in Docker

- Start on [this](http://localhost:4173)
- Open source
- Save your task in your browser 
- Deploy in [Vercel](https://vercel.com) (thx) on this link [https://kanban-local-three.vercel.app/](https://kanban-local-three.vercel.app/)
- My Gift 4 U

## First start
```bash
git clone https://github.com/SwarmGost404/kanban-local.git
cd kanban-local
sudo docker build -t vue-kanban .
sudo docker run -d -p 4173:5173 --name vue-kanban --restart unless-stopped vue-kanban
```

## start

```bash
sudo docker build -t vue-kanban .
sudo docker run -d -p 4173:5173 --name vue-kanban --restart unless-stopped vue-kanban
```

## stop 

```bash
sudo docker stop vue-kanban
sudo docker remove vue-kanban
```

## restart

```bash 
sudo docker restart vue-kanban
```

<em>I can create online desk, if you`ll send 10 stars</em>