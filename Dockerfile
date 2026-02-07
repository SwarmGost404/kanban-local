FROM node:20-alpine

WORKDIR /app

# Копируем package.json и устанавливаем зависимости
COPY package*.json ./
RUN npm install

# Копируем весь проект
COPY . .

# Экспонируем порт Vite (обычно 5173)
EXPOSE 4040

# Команда запуска Vite dev server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
