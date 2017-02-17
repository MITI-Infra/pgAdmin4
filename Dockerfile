FROM alpine
MAINTAINER Madrum <caue.alves@miti.com.br>

ENV SERVER_MODE 		True
ENV DEFAULT_SERVER_PORT		5050
ENV DEFAULT_SERVER		0.0.0.0
ENV DEFAULT_USER_MAIL		''
ENV DEFAULT_USER_PASS		''
ENV PGADMIN4_VERSION 		1.2
ENV PGADMIN4_DOWNLOAD_URL	https://ftp.postgresql.org/pub/pgadmin3/pgadmin4/v1.2/pip/pgadmin4-1.2-py2-none-any.whl

RUN set -x \
	&& apk add --no-cache postgresql-libs \
	&& apk add --no-cache --virtual .build-deps \
	&& apk add --no-cache python-dev \
			gcc \
			py-pip \
			postgresql-dev \
			gcc \
			musl-dev  \
	&& pip install $PGADMIN4_DOWNLOAD_URL \
	&& apk del gcc musl-dev py-pip \
	&& cd /usr/lib/python2.7/site-packages/pgadmin4 \
	&& cp config.py config_local.py \
	&& sed -i "s/SERVER_MODE = True/SERVER_MODE = False/g" config_local.py \
	&& sed -i "s/DEFAULT_SERVER = 'localhost'/DEFAULT_SERVER = '0.0.0.0'/g" config_local.py \
	&& apk del .build-deps \
	&& rm -rf /root/.cache


COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5050
