#!/bin/bash -x

# Создаём директорию для SSL сертификатов
mkdir -p ssl

# Генерируем SSL сертификат (если нет)
if [ ! -f ssl/nginx.crt ] || [ ! -f ssl/nginx.key ]; then
    echo "Generating SSL certificate..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout ssl/nginx.key \
        -out ssl/nginx.crt \
        -subj "/C=RU/ST=Perm/L=Perm/O=DevOps/OU=IT/CN=localhost"
fi

# Удаляем старый контейнер, если есть
docker stop nginx-cont 2>/dev/null
docker rm nginx-cont 2>/dev/null

# Собираем образ
echo "Building Docker image..."
docker build -t devops/nginx-server ./nginx

# Создаем и запускаем контейнер с SSL (два порта + volume для сертификатов)
echo "Creating and starting container with SSL..."
docker run -d --name nginx-cont \
  -p 54321:80 \
  -p 54322:443 \
  -v $(pwd)/ssl:/etc/nginx/ssl:ro \
  --restart unless-stopped \
  devops/nginx-server

# Проверяем
echo "Checking container status..."
docker ps -a

sleep 5

echo -e "\n=== Testing HTTP (port 54321) ==="
curl http://127.0.0.1:54321

echo -e "\n\n=== Testing HTTPS (port 54322) ==="
curl -k https://127.0.0.1:54322

echo -e "\n\n=== Last 10 log lines ==="
docker logs -n 10 nginx-cont

echo -e "\n=== SSL Certificate Info ==="
openssl x509 -in ssl/nginx.crt -noout -subject -dates
