FROM python:3.6

# Create app directory
WORKDIR /app

# Install app dependencies
COPY app/requirements.txt ./

RUN pip install -r requirements.txt

# Bundle app source
COPY app/hello.py /app

CMD [ "python", "hello.py" ]