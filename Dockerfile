############################################
# Base Image
############################################
FROM serversideup/php:8.4-fpm-nginx-alpine AS base

############################################
# Development Image
############################################
FROM base AS development

# We can pass USER_ID and GROUP_ID as build arguments
# to ensure the www-data user has the same UID and GID
# as the user running Docker.
ARG USER_ID
ARG GROUP_ID

# Switch to root so we can do root things
USER root

# Use the build arguments to change the UID
# and GID of www-data while also changing
# the file permissions for NGINX
RUN if [ -n "$USER_ID" ] && [ -n "$GROUP_ID" ]; then \
        docker-php-serversideup-set-id www-data $USER_ID:$GROUP_ID && \
        \
        # Update the file permissions for our NGINX service to match the new UID/GID
        docker-php-serversideup-set-file-permissions --owner $USER_ID:$GROUP_ID --service nginx; \
    fi

# Drop back to our unprivileged user
USER www-data

############################################
# CI image
############################################
FROM base AS ci

# Sometimes CI images need to run as root
# so we set the ROOT user and configure
# the PHP-FPM pool to run as www-data
USER root
RUN echo "user = www-data" >> /usr/local/etc/php-fpm.d/docker-php-serversideup-pool.conf && \
    echo "group = www-data" >> /usr/local/etc/php-fpm.d/docker-php-serversideup-pool.conf

############################################
# Production Image
############################################

# Since we're calling "base", production isn't
# calling any of that permission stuff
FROM base AS production

# Copy our app files as www-data (33:33)
COPY --chown=www-data:www-data . /var/www/html
