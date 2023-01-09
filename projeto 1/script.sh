#!/bin/bash

echo -e "\n$(tput setaf 0)$(tput setab 3)Criando imagens...$(tput sgr 0)\n"

docker build -t jorgemagno/db-projeto-dio:1.0 database/.
docker build -t jorgemagno/backend-projeto-dio:1.0 backend/.

echo -e "\n$(tput setaf 0)$(tput setab 3)Subindo imagens para Docker Hub...$(tput sgr 0)\n"

docker push jorgemagno/db-projeto-dio:1.0
docker push jorgemagno/backend-projeto-dio:1.0

echo -e "\n$(tput setaf 0)$(tput setab 3)Criando serviços...$(tput sgr 0)\n"

kubectl apply -f pv-pvc.yml
kubectl apply -f deployment.yml
kubectl apply -f services.yml
