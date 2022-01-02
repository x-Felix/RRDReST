FROM python:3.10-alpine
RUN apk add g++ make rrdtool
COPY requirements.txt /opt/RRDReST/requirements.txt
WORKDIR /opt/RRDReST
RUN pip3 install -r requirements.txt
COPY . /opt/RRDReST
ENTRYPOINT ["uvicorn", "rrdrest:rrd_rest"]
CMD ["--host", "0.0.0.0", "--port", "9000"]
