# O FROM serve para indicar a imagem utilizada como base.
FROM ubuntu

# MAINTAINER é quem cria a imagem.
MAINTAINER Horácio Dias Baptista Neto <horacio.dias@yahoo.com>

# O RUN executa comandos durante o build, que serão
# refletidos na imagem final. Há várias formas de passar
# os parâmetros, eu costumo utilizar esta:
## Vamos atualizar o APT.
RUN ["apt-get", "update"]
 
## E instalar o Inkscape
RUN ["apt-get", "install", "-y", "inkscape"]
 
## Finalmente vamos criar o login player, não é legal
# usar root para tarefas onde não precisamos deste privilégio.
# O ID deste usuário deve ser igual o ID da pessoa que executa o contêiner,
# que geralmente é 1000.
RUN ["useradd", "player", "-u", "1000", "-g", "100", "-m", "-d", "/home/player", "-s", "/bin/bash"]
 
# USER faz com que você troque o ID que está executando os
# comandos a seguir.
USER player
 
# ENTRYPOINT define o comando que executará quando o contêiner
# for executado a partir da imagem.
ENTRYPOINT ["/usr/bin/inkscape"]
