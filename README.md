<p align="center">
<a href="https://herd.laravel.com/new?starter-kit=pikarin/ajt-api-starter"><img src="https://img.shields.io/badge/Install%20with%20Herd-f55247?logo=laravel&logoColor=white"></a>
</p>

# API Starter Kit

A Laravel API starter kit with a focus on building robust and scalable API services. This starter kit comes pre-configured with essential tools and best practices for API development.

## Features

- PHP 8.3+ and Laravel 12.0+
- Docker setup with PHP 8.3, FPM, and Nginx
- API documentation with Scramble
- Authentication with Laravel Sanctum
- Testing setup with Pest
- Code quality tools (Pint, PHPStan)

## Prerequisites

- PHP 8.3 or higher
- Composer
- Docker and Docker Compose (optional, for containerized development)
- MySQL or SQLite for database

## Installation

You can install this starter kit using one of the following methods:

### 1. Using Composer Create-Project

```bash
composer create-project pikarin/ajt-api-starter your-project-name
cd your-project-name
```

### 2. Using Laravel New Command

First, make sure you have the Laravel installer:

```bash
composer global require laravel/installer
```

Then create a new project using this starter kit:

```bash
laravel new --using pikarin/ajt-api-starter your-project-name
cd your-project-name
```

### 3. Using Laravel Herd

If you're using Laravel Herd, you can click the "Install with Herd" badge:

<a href="https://herd.laravel.com/new?starter-kit=pikarin/ajt-api-starter"><img src="https://img.shields.io/badge/Install%20with%20Herd-f55247?logo=laravel&logoColor=white"></a>

## Post-Installation Steps

After installing the project, you should:

1. Configure your environment variables:
   ```bash
   cp .env.example .env
   ```

2. Install dependencies:
   ```bash
   composer install
   ```

3. Generate key:
   ```bash
   php artisan key:generate
   ```

4. Set up your database in the .env file:
   ```env
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=your_database_name
   DB_USERNAME=your_database_user
   DB_PASSWORD=your_database_password
   ```

5. Run migrations:
   ```bash
   php artisan migrate
   ```

6. Start the development server:
   ```bash
   docker-compose up -d
   ```

## Running Tests

```bash
php artisan test
```
