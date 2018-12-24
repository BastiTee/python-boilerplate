FROM nginx:stable-alpine

# Default environment
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Install necessary third-party software
RUN apk update && apk add \
    vim alpine-sdk linux-headers python3 python3-dev pcre pcre-dev
RUN pip3 install --upgrade pip uwsgi pipenv

# Install application dependencies
COPY Pipfile /Pipfile
RUN pipenv lock -r > /requirements.txt
RUN pip3 install -r requirements.txt

# Configure NGINX
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

# Copy application source code
COPY acme /app
COPY docker/uwsgi.ini uwsgi.ini

# Prepare run procedure
COPY docker/run.sh /run.sh
RUN chmod a+x /run.sh
RUN adduser -D -u 1000 uwsgi

# Startup hook
EXPOSE 80
ENTRYPOINT [ "/run.sh" ]
