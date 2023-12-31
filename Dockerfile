FROM debian:bullseye-slim

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    postfix \
    bsd-mailx \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY postfix.sh /
RUN chmod +x /postfix.sh
EXPOSE 25
CMD ["/postfix.sh"] && tail -f /dev/null
