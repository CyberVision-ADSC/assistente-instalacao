#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Olá, serei seu assistente para instalação!"
sleep 2
echo  "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7)  Para começarmos, vou verificar se você possui o Java instalado...;"
sleep 2

java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) : Olá você já tem o java instalado!!"
		sleep 2
		cd db
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Agora, vou criar um ambiente MySQL para você."
		sleep 2

		#Cria a imagem do docker
		sudo docker build -t dockerfile .

		#executar o container com suas variaveis de ambiente
		sudo docker run -d -p 3306:3306 --name CyberVisionBD -e "MYSQL_ROOT_PASSWORD=urubu100" -e "MYSQL_DATABASE=cybervision" dockerfile
		sleep 2
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Agora, vamos para a etapa de instalação da aplicação CyberVision."
		sleep 2
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Por favor escolha a versão que deseja instalar:"
		sleep 2
		echo "Digite 'g' para fazer o download do CyberVision GUI"
		echo"Digite 'c' para fazer o download do CyberVision CLI"
		read inp
		if [ \"$inp\" == \"G\" ||  \"$inst\" == \"g\"]
			git clone https://github.com/CyberVision-ADSC/download-cybervision-jar.git
		else
			git clone https://github.com/CyberVision-ADSC/download-cybervision-jar-cli.git
		fi

		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) : Obrigado por escolher a Cybervision!"
		sleep 2
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) : Você já pode utilizar a aplicação! :)"
		sleep 5
	else
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
		sleep 2
		echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Java (Y/n)?"		
		read inst
		
		if [ \"$inst\" == \"Y\" ||  \"$inst\" == \"y\"]
			then
				echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7)  Ok. Você escolheu instalar o Java!"
				sleep 2
				echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7)  Adicionando o repositório."
				sleep 2
				sudo add-apt-repository ppa:webupd8team/java -y
			
				echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7)  Atualizando Pacotes. Quase lá!"
				sleep 2
				sudo apt update -y
			
				if [ $VERSAO -eq 11 ]
					then
						echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Preparando para instalar a versão 11 do Java."
						sleep 1
						sudo apt install default-jre ; apt install openjdk-11-jre-headless; -y
					
						echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Java instalado com sucesso!"
						sleep 1

						echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Agora, vou criar um ambiente MySQL para você."
						sleep 2
						sudo apt install docker.io -y
						sleep 5
						sudo systemctl start docker
						sleep 5
						sudo systemctl enable docker

						cd db
						#Cria a imagem do docker
						sudo docker build -t dockerfile .

						#executar o container com suas variaveis de ambiente
						sudo docker run -d -p 3306:3306 --name CyberVisionBD -e "MYSQL_ROOT_PASSWORD=urubu100" -e "MYSQL_DATABASE=cybervision" dockerfile
						sleep 2
						echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Agora vamos instalar o CyberVision."
						sleep 2
						echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) Por favor escolha a versão que deseja instalar:"
						sleep 2

						git clone https://github.com/CyberVision-ADSC/download-cybervision-jar-cli.git

						echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) : Obrigado por escolher a Cybervision!"
						sleep 2
						echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7) : Agora você já pode utilizar a aplicação!"
						sleep 5

					fi
			else 	
				echo "$(tput setaf 10)[Cybervision assistant]:$(tput setaf 7)  Você optou por não instalar o Java por enquanto, até a próxima então!"
				sleep 1
		fi
fi

# ===================================================================
# Todos direitos reservados para o autor: Dra. Profa. Marise Miranda.
# Sob licença Creative Commons @2020
# Podera modificar e reproduzir para uso pessoal.
# Proibida a comercialização e a exclusão da autoria.
# ===================================================================