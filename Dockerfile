FROM python

RUN mkdir /hello
WORKDIR /hello
ADD . /hello/
RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["python", "/hello/hello.py"]