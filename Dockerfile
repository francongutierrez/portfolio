FROM php:8.2-fpm

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git

# Instalar Composer y actualizarlo a la versión más reciente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer self-update --2  # Asegúrate de que Composer esté en la versión 2.x

# Instalar extensiones de PHP necesarias
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Configuración de trabajo
WORKDIR /var/www/html

# Copiar los archivos del proyecto
COPY . .

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html

# Limpiar caché de Composer
RUN composer clear-cache

# Instalar dependencias con Composer
RUN COMPOSER_MEMORY_LIMIT=-1 composer install --no-dev --optimize-autoloader

# Exponer el puerto 9000 y arrancar el servicio
EXPOSE 9000
CMD ["php-fpm"]
