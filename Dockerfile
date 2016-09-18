FROM dnjo/ruby-rbenv

ENV ENVCONSUL_VERSION 0.6.1
ENV PHANTOM_JS_VERSION 2.1.1-linux-x86_64

RUN mkdir /app
WORKDIR /app

RUN curl -sSL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOM_JS_VERSION.tar.bz2 | tar xjC / && \
    ln -s /phantomjs-$PHANTOM_JS_VERSION/bin/phantomjs /usr/local/bin/

RUN apt-get update && \
    apt-get install -y curl unzip net-tools netcat && \
    curl -L -o ./consul.zip https://releases.hashicorp.com/envconsul/${ENVCONSUL_VERSION}/envconsul_${ENVCONSUL_VERSION}_linux_amd64.zip && \
    unzip ./consul.zip && \
    rm ./consul.zip && \
    mv ./envconsul /usr/local/bin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* *.gz

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -y nodejs

COPY scripts/run /scripts/run
ENTRYPOINT ["/scripts/run"]
