### From https://stackoverflow.com/questions/51121875/how-to-run-docker-with-python-and-java
### 1. Get Linux
FROM ubuntu:18.04
LABEL maintainer="cjmungall@lbl.gov" \
      name="semanticsql" \
      version="0.0.1"

### 2. Get Java, Python and all required system libraries (version control etc)
ENV JAVA_HOME="/usr"
WORKDIR /tools
ENV PATH "/tools/:$PATH"
COPY requirements.txt /tools/
COPY ./utils/create-semsql-db.sh /tools/
##COPY utils/* /tools/

# 1. Upgrade installed packages
# 2. Install python 3.7.10 (or newer)
# 3. Register the version in alternatives (and set higher priority to 3.7)
# 4. Upgrade pip to latest version

RUN apt update && apt upgrade -y && apt clean && \
    apt update && \
    apt install --no-install-recommends -y build-essential software-properties-common curl && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt install --no-install-recommends -y python3.7 python3.7-dev python3.7-distutils && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2 && \
    curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py --force-reinstall && \
    rm get-pip.py
  
# Install packages
RUN apt-get update &&\
  apt-get install -y software-properties-common &&\
  apt-get upgrade -y &&\
  apt-get install -y build-essential \
    git \
    openjdk-8-jre \
    openjdk-8-jdk \
    maven \
    #python3-pip \
    #python3-dev \
    subversion \
    make \
    automake \
    gcc \
    g++ \
    unzip \
    rsync \
    curl \
    wget \
    jq \
    openssl \
    aha \
    dos2unix \
    sqlite3 \
    libjson-perl \
    libfreetype6-dev \
    libpng-dev \
    pkg-config \
    xlsx2csv &&\
    cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip setuptools \
    && pip3 install -r /tools/requirements.txt

###### ROBOT ######
ENV ROBOT v1.8.1
ARG ROBOT_JAR=https://github.com/ontodev/robot/releases/download/$ROBOT/robot.jar
ENV ROBOT_JAR ${ROBOT_JAR}
# LAYERSIZE ~66MB
RUN wget $ROBOT_JAR -O /tools/robot.jar && \
    wget https://raw.githubusercontent.com/ontodev/robot/$ROBOT/bin/robot -O /tools/robot && \
    chmod +x /tools/robot && \
    chmod +x /tools/robot.jar

# Avoid repeated downloads of script dependencies by mounting the local coursier cache:
# docker run -v $HOME/.coursier/cache/v1:/tools/.coursier-cache ...
ENV COURSIER_CACHE "/tools/.coursier-cache"

###### JENA ######
ENV JENA 3.12.0
RUN wget http://archive.apache.org/dist/jena/binaries/apache-jena-$JENA.tar.gz -O- | tar xzC /tools 
ENV PATH "/tools/apache-jena-$JENA/bin:$PATH"

###### relation-graph ######
ENV RGVERSION=1.1
ENV PATH "/tools/relation-graph/bin:$PATH"
# LAYERSIZE ~200MB
RUN wget -nv https://github.com/balhoff/relation-graph/releases/download/v$RGVERSION/relation-graph-$RGVERSION.tgz \
&& tar -zxvf relation-graph-$RGVERSION.tgz \
&& mv relation-graph-$RGVERSION /tools/relation-graph \
&& chmod +x /tools/relation-graph 

### TODO REVIEW THIS. As we speak, jq is official still stalled at 1.5, but for the walk function, we
### Need 1.6 - once 1.6 is offcial, the following RUN can be removed.
# LAYERSIZE: ~4MB
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -O /tools/jq && chmod +x /tools/jq

COPY semsql /tools/semsql/
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8


CMD python3 -m semsql.subgraph 
#-d db/envo.db ocean% -m label -f viz -s  conf/obograph-style.json 
