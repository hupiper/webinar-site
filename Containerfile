FROM ubi9/nginx-120

COPY --chown=default /docs/ /opt/app-root/src/
COPY --chown=default nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

CMD nginx -g "daemon off;"

