# П10: Kubernetes Tools — Helm, Kompose, Kustomize

## Описание
Использование продвинутых инструментов для управления Kubernetes.

## Что сделано

### Часть 1: Helm + Kompose (Prometheus-Grafana)
- Установлен Helm
- Установлен Kompose
- Сконвертирован `docker-compose.yml` в Helm chart
- Развёрнут release в k8s
- Проверена работа Grafana в браузере

### Часть 2: Kustomize (Flask-Redis)
- Созданы базовые манифесты (`base/`)
- Создано **DEV** окружение (2 реплики, порт 54321)
- Создано **PROD** окружение (3 реплики, порт 8000)
- Оба окружения работают параллельно
- Проверена балансировка нагрузки

## Структура проекта

- `P10-K8s-Tools/` — корневая папка лабы
  - `README.md` — документация
  - `screenshots/` — скриншоты выполнения
  - `helm-prometheus/` — Helm chart для Prometheus-Grafana
    - `Chart.yaml` — метаданные chart
    - `values.yaml` — настраиваемые значения
    - `templates/` — шаблоны Kubernetes ресурсов
  - `kustomize-flask/` — Kustomize структура для Flask-Redis
    - `base/` — базовые манифесты
    - `dev/` — DEV overlay
    - `prod/` — PROD overlay
