echo -e "\n$(tput setaf 0)$(tput setab 3)Criando imagens...$(tput sgr 0)\n"

docker build -t jorgemagno/db-projeto2-dio:1.0 app/.

echo -e "\n$(tput setaf 0)$(tput setab 3)Subindo imagens para Docker Hub...$(tput sgr 0)\n"

docker push jorgemagno/db-projeto2-dio:1.0

echo -e "\n$(tput setaf 0)$(tput setab 3)Criando serviços...$(tput sgr 0)\n"

kubectl apply -f pv-pvc.yml
kubectl apply -f mysql-deploy.yml --record
kubectl apply -f app-deploy.yml --record