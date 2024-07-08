# Use uma imagem base do Ubuntu 20.04
FROM ubuntu:20.04

# Atualize o sistema e instale as dependências necessárias
RUN apt-get update && \
    apt-get install -y curl gnupg wget && \
    rm -rf /var/lib/apt/lists/*

# Instale o OpenJDK 17
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

# Instale o Node.js 14 usando NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g @oracle/suitecloud-cli --acceptsuitecloudsdklicense --unsafe-perm=true --allow-root
RUN npm install -g typescript --unsafe-perm=true --allow-root

# Verifique as versões instaladas do Java e Node.js
RUN java -version
RUN node -v
RUN npm -v

# Defina o diretório de trabalho padrão
WORKDIR /app

# Comando padrão para iniciar o container
CMD ["bash"]