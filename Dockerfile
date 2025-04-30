# Use official PHP with Apache
FROM php:8.1-apache

# Install required extensions
RUN docker-php-ext-install pdo_mysql

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy files
COPY . .

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod 755 /var/www/html \
    && chmod 644 index.php composer.json \
    && touch users.json error.log \
    && chmod 666 users.json error.log

# Expose port
EXPOSE 80
