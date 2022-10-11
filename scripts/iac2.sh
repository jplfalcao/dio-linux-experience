#!/usr/bin/env bash
# Autor: João Falcão
# Github: https://github.com/jplberserk
# Decrição: Infraestrutura as Code (iac2.sh) é um script de provisionamento de um servidor web apache.
# Data de criação: 05/08/2022 
# Data de modificação: 06/08/2022
# Versão: 1.1

# Verifica se o usuário é root.
verificaroot=$(id -u)
if [ "$verificaroot" == 0 ]
then
    echo -e "Inicando procedimento..."
    sleep 5
# Atualizando as listas de repositórios.
    echo -e "Atualizando repositórios..."
    apt-get update -y &> /dev/null
    apt-get upgrade -y &> /dev/null
    echo -e "Repositórios atualizados com sucesso!\n"
else
    echo "Usuário não é root. Procedimento não concluído!"
    exit 1
fi

# Variável que verificará se o apache2 está instalado.
verificapache=$( dpkg -L apache2 &> /dev/null )
# Variável especial do shell '$?' que retorna o resultado do comando anterior.
retorno=$( echo "$?" )

# Testa se o comando anterior NÃO '!' é igual a '0'.
if [ ! "$retorno" == 0 ] 
then
    echo -e "Instalando o servidor web apache2..."
    sleep 5
    apt-get install apache2 -y &> /dev/null
    apt-get install unzip -y &> /dev/null
    echo -e "Servidor web instalado com sucesso!\n"
else
    echo -e "Servidor web apache2 já instalado. Saindo do script!\n"
    exit 1
fi

# Criando o diretório para onde será hospedado o site.
echo -e "Baixando e copiando os arquivos da aplicação..."
sleep 5
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip &> /dev/null
unzip main.zip &> /dev/null
cd linux-site-dio-main
cp -R * /var/www/html
echo -e "Arquivos copiados com sucesso!\n"

echo -e "Procedimento finalizado!"

