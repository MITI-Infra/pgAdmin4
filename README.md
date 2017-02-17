pgAdmin é uma ferramenta open-source para Administração e Gerenciamento para o PostgreSQL.  

É um software livre feito pelo PostgreSQL License.  

Como montar (Build)  

Dentro da sua pasta dockerfile, crie a pasta pgAdmin4:  
~/dockerfile# mkdir pgAdmin4  
~/dockerfile# cd pgAdmin4  
~/dockerfile/pgAdmin4#  

Baixe os arquivos:  
~/dockerfile/pgAdmin4# wget https://github.com/MITI-Infra/pgAdmin4/blob/master/Dockerfile  
~/dockerfile/pgAdmin4# wget https://github.com/MITI-Infra/pgAdmin4/blob/master/docker-entrypoint.sh  
~/dockerfile/pgAdmin4# ls  
Dockerfile  docker-entrypoint.sh  

Monte agora a imagem do docker:  
~/dockerfile/pgAdmin4# docker build -t pgadmin4:latest .  

Crie o container do pgAdmin4:  
~/dockerfile/pgAdmin4# docker run --name pgadmin4-miti -p 5050:5050 -d pgadmin4:latest  

Veja se está rodando (up):  
~# docker ps  
CONTAINER ID        IMAGE             COMMAND               CREATED           STATUS            NAMES              PORTS  
5986f0817de5  pgadmin4:latest  "/docker-entrypoint.sh"   10 seconds ago   Up 10 seconds ago pgadmin4-miti 0.0.0.0:5050->5050/tcp  

Pronto!  

Abra o pgAdmin pelo navegador (browser):  
http://localhost:5050 ou http://host-ip:5050
