# Projeto Final 

1-Para criar a imagem `dio-db` (conforme linha 5 do arquivo docker-compose.yml) é necessário executar o seguinte comando: `docker build -t dio-db .` (com o caractere ponto [.] ao final do comando);

2-Após criar a imagem, rode o comando a seguir para iniciar os containers: `docker-compose up` (se quiser liberar o terminal utilize a opção `-d`);

3-Com os containers em execução, para acessar o `phpmyadmin` e consultar o banco de dados criado, abra o navegador e digite o ip do host (utilize o comando `ip -c a`);

4-Utilize o usuário e senha definido no arquivo `docker-compose.yml`.
