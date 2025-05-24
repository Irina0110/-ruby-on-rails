# Система управления отелями

Веб-приложение для управления информацией об отелях, включая рейтинги, отзывы и фотографии.

## Функциональность

- Регистрация и авторизация пользователей
- Просмотр списка отелей
- Добавление и редактирование информации об отелях
- Загрузка фотографий отелей
- Система рейтингов и отзывов
- Многоязычный интерфейс (русский/английский)

## Технологии

- Ruby on Rails 8.0
- PostgreSQL
- Devise для аутентификации
- CarrierWave для загрузки файлов
- Bootstrap для стилизации
- Slim для шаблонов
- i18n для локализации

## Требования

- Ruby 3.2.0 или выше
- PostgreSQL
- Node.js и Yarn
- Bundler

## Установка

1. Клонируйте репозиторий:
```bash
git clone <url-репозитория>
cd lab1
```

2. Установите зависимости:
```bash
bundle install
```

3. Создайте файл `.env` в корневой директории проекта и добавьте следующие переменные окружения:
```env
# Database configuration
DB_HOST=localhost
DB_PORT=5432
DB_NAME=hotels
DB_USER=postgres
DB_PASSWORD=your_password

# SMTP configuration
SMTP_ADDRESS=smtp.gmail.com
SMTP_PORT=587
SMTP_DOMAIN=gmail.com
SMTP_USERNAME=your-email@gmail.com
SMTP_PASSWORD=your-app-password
SMTP_AUTHENTICATION=plain
SMTP_ENABLE_STARTTLS_AUTO=true

# Application configuration
RAILS_MAX_THREADS=5
RAILS_ENV=development
SECRET_KEY_BASE=your-secret-key-base
```

4. Создайте базу данных и выполните миграции:
```bash
rails db:create
rails db:migrate
```

5. Заполните базу данных тестовыми данными:
```bash
rails db:seed
```

Это создаст:
- Тестового администратора (email: admin@example.com, пароль: password)
- Несколько отелей с рейтингами и отзывами
- Примеры загруженных фотографий

6. Запустите сервер:
```bash
rails server
```

Приложение будет доступно по адресу http://localhost:3000

## Разработка

### Структура проекта

- `app/controllers/` - контроллеры приложения
- `app/models/` - модели данных
- `app/views/` - представления
- `config/` - конфигурационные файлы
- `db/` - миграции и схема базы данных
- `public/` - статические файлы
- `test/` - тесты

### Основные команды

- `rails server` - запуск сервера разработки
- `rails console` - запуск консоли Rails
- `rails db:migrate` - выполнение миграций базы данных
- `rails test` - запуск тестов

## Безопасность

- Все конфиденциальные данные хранятся в переменных окружения
- Файл `.env` добавлен в `.gitignore`
- Используется Devise для безопасной аутентификации
- Реализована защита от CSRF-атак
