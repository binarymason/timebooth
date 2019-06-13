FROM postgres:11.1

# Expose a new volume mount that postgres user has write access to.
ENV ARCHIVE_DIR=/mnt/server/archivedir
RUN mkdir -p ${ARCHIVE_DIR}
RUN chown -R postgres ${ARCHIVE_DIR}

# Ensure user is postgres before declaring volume.
# Otherwise it will be owned by root.
USER postgres
VOLUME ${ARCHIVE_DIR}
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
