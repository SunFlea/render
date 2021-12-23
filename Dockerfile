FROM php:7.4-cli

ADD ./ /app
WORKDIR /app

# Install
RUN apt update && apt install -y cron

# Add crontab file in the cron directory
ADD docker/crontab /etc/cron.d/cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cron
RUN crontab /etc/cron.d/cron
RUN touch /var/log/cron.log

CMD cron -f