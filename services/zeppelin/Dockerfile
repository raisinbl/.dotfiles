FROM apache/zeppelin:0.11.1

USER root
# RUN apt update && apt install -y vim
RUN apt update && apt install inetutils-ping telnet net-tools vim -y 
# remove all the file that are tar unknown header
RUN find /opt/zeppelin/ -name "._*" -exec rm -rf {} +
USER 1000
