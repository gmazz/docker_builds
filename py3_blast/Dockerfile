FROM python:3-slim

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Update
RUN apt update -y
RUN apt upgrade -y

# Installing packages
RUN apt install ncbi-blast+/stable -y

WORKDIR /app
ADD src /app/src
ADD data /app/data

CMD ["/bin/bash"]
