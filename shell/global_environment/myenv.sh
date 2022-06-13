# myenv.sh
# set the global environment of basic module such as java, python, scala, maven etc.
# ln -s /home/wedo/github/myconf/zsh/myenv.sh /etc/profile.d/myenv.sh

# set our umask 
umask 022
# load local environment

LOCAL_HOME=~/.local/bin
if test -d ${LOCAL_HOME};then
	export PATH=${PATH}:${LOCAL_HOME}
fi

# set java environment
JAVA_HOME=/opt/shortcut/jdk
if test -d ${JAVA_HOME}; then
	export JAVA_HOME
	export PATH=$JAVA_HOME/bin:$PATH
	export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/tools/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/tools/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/tools/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/tools/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# set python environment
PYTHON_HOME=/opt/shortcut/python3
if test -d ${PYTHON_HOME}; then
	export PYTHON_HOME
	export PATH=$PYTHON_HOME/bin:$PATH 
#fi

# set maven environment 
MAVEN_HOME=/opt/shortcut/maven
if test -d ${MAVEN_HOME}; then
	export MAVEN_HOME
	export PATH=$MAVEN_HOME/bin:$PATH 
fi


# set scala environment

SCALA_HOME=/opt/shortcut/scala
if test -d ${SCALA_HOME}; then
	export SCALA_HOME
	export PATH=$PATH:$SCALA_HOME/bin
fi


# set hadoop environment
HADOOP_HOME=/opt/shortcut/hadoop
if test -d ${HADOOP_HOME}; then
	export HADOOP_HOME
	export HADOOP_PID_DIR=${HADOOP_HOME}/pids
	export YARN_PID_DIR=${HADOOP_HOME}/pids
	export PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
fi

# set airflow environment
AIRFLOW_HOME=/opt/shortcut/airflow
if test -d ${AIRFLOW_HOME}; then
	export AIRFLOW_HOME
	#export PATH=${PATH}:${AIRFLOW_HOME}/bin
fi

# set emacs environment
EMACS_HOME=/opt/shortcut/emacs
if [[ -d ${EMACS_HOME} ]]; then
	export EMACS_HOME
	export PATH=${PATH}:${EMACS_HOME}/bin
fi

# set Zookeeper environment
ZK_HOME=/opt/shortcut/zookeeper
if [[ -d ${ZK_HOME} ]]; then
	export ZK_HOME
	export PATH=${PATH}:${ZK_HOME}/bin
fi

#set docker-compose environment
DOCKER_COMPOSE_FILE=/opt/shortcut/docker-compose
if [[ -f  ${DOCKER_COMPOSE_FILE} ]]; then
	export PATH=${PATH}:${DOCKER_COMPOSE_FILE}
fi
