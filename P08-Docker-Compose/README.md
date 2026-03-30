# П08: Docker Compose

## Описание
Развёртывание многоконтейнерного приложения с помощью Docker Compose: веб-приложение Flask, базы данных Redis, мониторинга Prometheus и визуализации Grafana.

## Что сделано
- Создано Flask приложение (app.py) с метриками для Prometheus
- Написан Dockerfile для веб-приложения
- Создан compose.yaml для оркестрации контейнеров
- Настроены сервисы: web (Flask), redis, prometheus, grafana
- Настроены volumes для сохранения данных
- Настроены networks для связи контейнеров
- Настроен Blackbox Exporter для мониторинга внешних сайтов
- Запущено приложение через docker-compose up
- Проверена работа всех сервисов

## Технологии
- Docker Compose (оркестрация контейнеров)
- Flask (веб-фреймворк Python)
- Redis (база данных key-value)
- Prometheus (система мониторинга и сбора метрик)
- Grafana (визуализация метрик)
- Blackbox Exporter (мониторинг доступности сайтов)

## Структура проекта

- `P08-Docker-Compose/` — корневая папка лабораторной работы
  - `app.py` — Flask веб-приложение с эндпоинтами (/, /metrics, /redis, /health)
  - `dockerfile` — инструкции для сборки образа веб-приложения (FROM python, COPY, RUN pip install, CMD)
  - `requirements.txt` — зависимости Python (flask, redis, prometheus_client)
  - `compose.yaml` — конфигурация Docker Compose с описанием сервисов:
    - `web` — Flask приложение (порт 8000:5000)
    - `redis` — база данных Redis (порт 6379)
    - `prometheus` — система мониторинга (порт 9090)
    - `grafana` — визуализация метрик (порт 3000)
    - `blackbox` — Blackbox Exporter для probing внешних сайтов (порт 9115)
  - `prometheus-grafana/` — папка с конфигурацией Prometheus и Grafana
    - `prometheus.yml` — конфигурация scraping метрик (web app, prometheus, blackbox)
  - `screens/` — папка со скриншотами выполнения
