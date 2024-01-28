# base Docker image that we will build on
FROM python:3.11.6

RUN apt-get install wget
# set up our image by installing prerequisites; pandas in this case
RUN pip install pandas sqlalchemy psycopg2-binary

# set up the working directory inside the container
WORKDIR /app
# copy the script to the container. 1st name is source file, 2nd is destination
COPY ingest_data.py ingest_data.py

# define what to do first when the container runs
# in this example, we will just run the script
ENTRYPOINT ["python", "ingest_data.py"]