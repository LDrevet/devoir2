FROM python:3.8.2
COPY manager manager
ENV POSTGRES_USER=ldrevet
ENV POSTGRES_PASSWORD=Fen
ENV POSTGRES_DB=alaid
ENV CSV_FILENAME=data.csv
RUN pip install psycopg2
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--"]
CMD ["python", "-m", "manager"]

