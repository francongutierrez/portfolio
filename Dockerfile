# Usa una imagen base con PHP y Composer
FROM php:8.1-fpm

# Instala extensiones necesarias
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-install pdo pdo_mysql zip

# Instala Composer
COPY --from=composer:2.1 /usr/bin/composer /usr/bin/composer

# Configura el directorio de trabajo
WORKDIR /var/www

# Copia los archivos del proyecto
COPY . .

# Instala dependencias de Composer
RUN composer install --no-dev --optimize-autoloader

# Da permisos al almacenamiento
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Define el comando de inicio
CMD php artisan serve --host=0.0.0.0 --port=80
