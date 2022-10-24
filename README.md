# learn-az-container

Test and Try Registry AZ    
    
1- Création d'un Container registry
    
Nom:    
learnContainerByJt.azurecr.io    
    
2- Dans Cloud Shell    
    
Cette commande envoie le contenu du dossier au registre de conteneurspar me biais d'un agent, qui utilise les instructions du fichier Docker pour générer l’image `learnContainerByJt` et la stocker.
```
git clone https://github.com/jt-tokeosoftware/learn-az-container.git
cd learn-az-container
az acr build --registry learnContainerByJt --image webimage .
```