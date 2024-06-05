#!/bin/bash

# Obtém o código do nome da versão do Ubuntu.
CODENAME=$(grep VERSION_CODENAME /etc/os-release | cut -d '=' -f 2)

# responsável pela atualização do respositorios.
apt update

# pacotes necessários para o docker.
apt install -y apt-transport-https ca-certificates curl software-properties-common

# Baixa a chave GPG pública usada para verificar os pacotes do repositório Docker e Descriptografa a chave GPG baixada e a converte para um formato legível.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $CODENAME stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# responsável pela atualização do respositorios.
apt update

# Instalação do Docker
apt-get install -y docker.io

# instalação do docker-compose
wget https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64

# renomeando o diretorido/arquivo
mv docker-compose-linux-x86_64 docker-compose

# movendo o docker-compose para o /bin
mv docker-compose /bin/

# tornando executavel.
chmod +x /bin/docker-compose

# verificando versao do docker e docker-compose
docker-compose --version
docker --version

