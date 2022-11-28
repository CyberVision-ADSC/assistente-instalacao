#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Olá, serei seu assistente para instalação!"
sleep 2
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Para começarmos, vou verificar se você possui o Java instalado."
sleep 2
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Procurando o Java em sua máquina..."
sleep 2

java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Olá você já tem o java instalado!"
		sleep 2
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Agora vamos instalar o CyberVision."
		sleep 2
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Por favor escolha a versão que deseja instalar:"
		sleep 2
		git clone https://github.com/CyberVision-ADSC/CyberVision-Java.git
		
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
		sleep 2
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Instalando o Java"		
		
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Adicionando o repositório!"
			sleep 2
			sudo add-apt-repository ppa:webupd8team/java -y
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Atualizando Pacotes! Quase lá."
			sleep 2
			sudo apt update -y
			clear
			
			if [ $VERSAO -eq 11 ]
				then
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Preparando para instalar a versão 11 do Java."
					sleep 5
					sudo apt install default-jre ; apt install openjdk-11-jre-headless; -y
					clear
					java -version
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Java instalado com sucesso!"
					sleep 5 
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Agora vamos instalar o CyberVision"
					sleep 2
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Por favor escolha a versão que deseja instalar:"
					sleep 2
					
					git clone https://github.com/CyberVision-ADSC/CyberVision-Java.git
				fi
			 			
		sleep 5
	fi
sudo docker build -t java .
sleep 30
sudo docker run -it --name CyberVision -p 8080:8080 java

# ===================================================================
# Todos direitos reservados para o autor: Dra. Profa. Marise Miranda.
# Sob licença Creative Commons @2020
# Podera modificar e reproduzir para uso pessoal.
# Proibida a comercialização e a exclusão da autoria.
# ===================================================================
