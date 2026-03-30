# П09: Kubernetes Basics

## Описание
Развёртывание приложения Flask+Redis в Kubernetes (minikube).

## Что сделано
- Развёрнут mini-кластер k8s с помощью minikube
- Создано Flask приложение с интеграцией Redis
- Собраны Docker образы flask:v1 и flask:v2
- Созданы манифесты Kubernetes
- Развёрнуты 2 реплики Flask + 1 Redis
- Настроен Service LoadBalancer (порт 8000)
- Выполнен Rolling Update v1 → v2

## Структура проекта
- `flask_redis_app/` — исходники приложения
  - `app.py` — Flask приложение
  - `Dockerfile` — образ приложения
  - `requirements.txt` — зависимости
- `flask_redis_k8s/` — манифесты Kubernetes
  - `flask.yml` — Deployment Flask
  - `flask-service.yml` — Service LoadBalancer
  - `redis.yml` — Deployment Redis
  - `redis-service.yml` — Service ClusterIP
- `screenshots/` — скриншоты выполнения
- `README.md` — документация
