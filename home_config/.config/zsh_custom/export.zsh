# Java
# case when Arch -> default, Ubuntu -> java-default (apt)
if [ "$(uname -o)" = "GNU/Linux" ] && grep -qi arch /etc/*-release 2>/dev/null; then
  export JAVA_HOME=/usr/lib/jvm/default
else
  export JAVA_HOME=/usr/lib/jvm/default-java
fi
export PATH=$PATH:$JAVA_HOME/bin

# Hadoop
export HADOOP_HOME=/opt/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# Spark
export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# Kafka 
export KAFKA_HOME=/opt/kafka
export PATH=$PATH:$KAFKA_HOME/bin

# HBase
export HBASE_HOME=/opt/hbase
export PATH=$PATH:$HBASE_HOME/bin

# Phoenix
export PHOENIX_HOME=/opt/phoenix
export PATH=$PATH:$PHOENIX_HOME/bin

# Airflow
export AIRFLOW_HOME=/opt/airflow

# Zookeeper
export ZOOKEEPER_HOME=/opt/zookeeper
export PATH=$PATH:$ZOOKEEPER_HOME/bin

# Nifi
export NIFI_HOME=/opt/nifi
export PATH=$PATH:$NIFI_HOME/bin

# IdeaPad Perf
export PATH=$PATH:$HOME/arch/utils/ideapad-perf

# Doris
export DORIS_HOME=/opt/doris
export PATH=$PATH:$DORIS_HOME/fe/bin
export PATH=$PATH:$DORIS_HOME/be/bin

# # Go
# export GOPATH=$HOME/go
# export GOBIN=$GOPATH/bin
# export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# npm dir
#export PATH=$PATH:$HOME/.config/npm-global/bin

# Electron Wayland
export ELECTRON_OZONE_PLATFORM_HINT="auto"
