FROM ubi9/python-39 as builder

COPY . /tmp/src/

RUN /opt/app-root/bin/python3.9 -m pip install --upgrade --no-cache-dir pip && \
    pip3 install --upgrade --no-cache-dir setuptools && \
    pip3 install --upgrade --no-cache-dir -r /tmp/src/requirements.txt

RUN cd /tmp/src && \
    mkdocs build --strict --site-dir /opt/app-root/src

FROM ubi9/nginx-120

COPY --chown=default /docs/ /opt/app-root/src/
COPY --chown=default nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

CMD nginx -g "daemon off;"

