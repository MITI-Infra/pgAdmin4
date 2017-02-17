pgAdmin é uma ferramenta open-source para Administração e Gerenciamento para o PostgreSQL.

É um software livre feito pelo PostgreSQL License.

Como montar (Build)

Dentro da sua pasta dockerfile, crie a pasta pgAdmin4:
~# cd ~/dockerfile

~/dockerfile# mkdir pgAdmin4

~/dockerfile# cd pgAdmin4

~/dockerfile/pgAdmin4#

Monte agora a imagem do docker:
~/dockerfile/pgAdmin4# docker build -t pgadmin4:latest .

Crie o container do pgAdmin4:
~/dockerfile/pgAdmin4# docker run --name some-pgadmin4 -p 5050:5050 -d pgadmin4

Veja se está rodando (up):
~# docker ps
CONTAINER ID   IMAGE            COMMAND              CREATED           STATUS           NAMES              PORTS
5986f0817de5  pgadmin4  "/docker-entrypoint.sh"   10 seconds ago   Up 10 seconds ago pgadmin4-miti 0.0.0.0:5050->5050/tcp

Pronto!

Abra o pgAdmin pelo navegador (browser):
http://localhost:5050 ou http://host-ip:5050
