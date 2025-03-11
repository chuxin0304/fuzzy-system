FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN fuzzy_system create-db
RUN fuzzy_system populate-db
RUN fuzzy_system add-user -u admin -p admin
EXPOSE 5000
CMD ["fuzzy_system", "run"]
