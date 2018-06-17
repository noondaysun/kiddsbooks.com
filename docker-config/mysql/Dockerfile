ARG MYSQL_VERSION=latest
FROM mysql:${MYSQL_VERSION}

#####################################
# Set Timezone
#####################################

ARG TZ=UTC
ENV TZ ${TZ}
ENV MYSQL_ROOT_PASSWORD JVTYHR^yfrhd2w7
ENV MYSQL_DATABASE homestead
ENV MYSQL_USER homestead
ENV MYSQL_PASSWORD JFJWRTP%375ahjwsg

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN chown -R mysql:root /var/lib/mysql/

ADD my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306