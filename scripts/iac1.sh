#!/usr/bin/env bash
# Autor: João Falcão
# Github: https://github.com/jplberserk
# Decrição: Infraestrutura as Code (iac1.sh) é um script voltado para criação automatizada de multiplos usuários.
# Data de criação: 02/08/2022 
# Data de modificação: 06/08/2022
# Versão: 1.2

# Verifica se o usuário é root.
verificaroot=$(id -u)
if [ "$verificaroot" == 0 ]
then
    echo -e "Inicando procedimento!
Criando diretórios..."
    sleep 5
    mkdir /publico /adm /ven /sec
    echo -e "Diretórios criados com sucesso!\n"
else
    echo -e "Usuário não é root. Procedimento não concluído!"
    exit 1
fi

# Criando os grupos utilizando uma lista '( )' e uma variável especial do shell '$@' que trata todos os parâmetros passados como strings.
grupos=( GRP_ADM GRP_SEC GRP_VEN )
echo -e "Criando grupos..."
sleep 5
for grp in ${grupos[@]}
do
    groupadd "$grp"
done
echo -e "Grupos criados com sucesso!\n"

# Criando os usuários utilizando uma lista '( )' e uma variável especial do shell '$@' que trata todos os parâmetros passados como strings.
usuariosADM=( carlos maria joao )
usuariosVEN=( debora sebastiana roberto )
usuariosSEC=( josefina amanda rogerio )
echo -e "Criando usuários e adicionando aos respectivos grupos..."
sleep 5

# Com loop 'for' o comando 'useradd' foi executado "exergando" a quantidade de strings passadas por cada variável (adm, ven, sec).
for adm in ${usuariosADM[@]}
do
    useradd "$adm" -m -s /bin/bash -p $(openssl passwd -crypt senha123) -G GRP_ADM
done
    for ven in ${usuariosVEN[@]}
    do
        useradd "$ven" -m -s /bin/bash -p $(openssl passwd -crypt senha123) -G GRP_VEN
    done
        for sec in ${usuariosSEC[@]}
        do  
            useradd "$sec" -m -s /bin/bash -p $(openssl passwd -crypt senha123) -G GRP_SEC
        done
echo -e "Usuários criados com sucesso!\n"

# Permissões concedidas para cada diretório.
echo -e "Especificando permissões aos diretórios..."
sleep 5
chown root:GRP_ADM /adm ; chmod 770 /adm
chown root:GRP_VEN /ven ; chmod 770 /ven
chown root:GRP_SEC /sec ; chmod 770 /sec
chmod 777 /publico
echo -e "Permissões setadas com sucesso!\n"

echo "Procedimento finalizado!"

