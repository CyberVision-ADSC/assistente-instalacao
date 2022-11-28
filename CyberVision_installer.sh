#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Olá, serei seu assistente para instalação!"
echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Para começarmos, vou criar um ambiente MySQL para você."
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

#Cria a imagem do docker
sudo docker build -t dockerfile_mysql .

#executar o container com suas variaveis de ambiente
sudo docker run -d -p 3306:3306 --name CyberVisionBD -e MYSQL_ROOT_PASSWORD=urubu100 -e MYSQL_DATABASE=cybervision Dockerfile_mysql
sleep 2
echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Agora, vou verificar se você possui o Java instalado."
sleep 2
echo  "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Procurando o Java em sua máquina..."
sleep 2

java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) : Olá você já tem o java instalado!"
		sleep 2
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Agora vamos instalar o CyberVision."
		sleep 2
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Por favor escolha a versão que deseja instalar:"
		sleep 2
		git clone https://github.com/CyberVision-ADSC/CyberVision-Java.git
		
	else 
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
		sleep 2
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Vamos criar um ambiente Java."		
			
			#Cria a imagem do docker
			sudo docker build -t Dockerfile_java .
			sleep 30
			sudo docker run -it --name CyberVisionJava -p 8080:8080 dockerfile_java
			clear
			echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Java instalado com sucesso!"
			sleep 5 
			echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Agora vamos instalar o CyberVision"
			sleep 2
			echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Por favor escolha a versão que deseja instalar:"
			sleep 2
					
			git clone https://github.com/CyberVision-ADSC/CyberVision-Java.git
			 			
		sleep 5
	fi

# ===================================================================
# Todos direitos reservados para o autor: Dra. Profa. Marise Miranda.
# Sob licença Creative Commons @2020
# Podera modificar e reproduzir para uso pessoal.
# Proibida a comercialização e a exclusão da autoria.
# ===================================================================