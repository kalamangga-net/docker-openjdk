FROM binhnv/base
MAINTAINER "Binh Van Nguyen<binhnv80@gmail.com>"

ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

RUN add-apt-repository -y ppa:openjdk-r/ppa \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        openjdk-8-jdk \
        ca-certificates-java \
    && update-alternatives --set java ${JAVA_HOME}/jre/bin/java \
    && /var/lib/dpkg/info/ca-certificates-java.postinst configure \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Need to install JCE http://docs.hortonworks.com/HDPDocuments/Ambari-2.2.1.1/bk_Ambari_Security_Guide/content/_distribute_and_install_the_jce.html
