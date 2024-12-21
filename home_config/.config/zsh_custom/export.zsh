# Java
export PATH="/usr/lib/jvm/default/:$PATH"
export JAVA_HOME=/usr/lib/jvm/default

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

# IdeaPad Perf
export PATH=$PATH:$HOME/arch/utils/ideapad-perf

# Go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# npm dir
#export PATH=$PATH:$HOME/.config/npm-global/bin

# Electron Wayland
export ELECTRON_OZONE_PLATFORM_HINT="auto"
