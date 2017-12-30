FROM python:2.7-alpine
MAINTAINER chris elliott <ctelliott@gmail.com>

# install dependencies
ADD ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# add password
ADD ./src/password.py /opt/password.py
RUN chmod +x /opt/password.py

CMD ["/opt/password.py"]
