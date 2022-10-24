# learn-az-container

Test and Try Registry AZ    
    
1- Interface Azure: Création d'un Container registry
    
Nom du Registre de containers:    
learnContainerByJt.azurecr.io    
    
2- Dans Cloud Shell    
    
Cette commande envoie le contenu du dossier au registre de conteneurspar me biais d'un agent, qui utilise les instructions du fichier Docker pour générer l’image `learnContainerByJt` et la stocker.
```
git clone https://github.com/jt-tokeosoftware/learn-az-container.git
cd learn-az-container
az acr build --registry learnContainerByJt --image webimage .
```

3- Interface Azure: Vérifier dans le Registre de container   
   
L'image Docker `webimage` doit apparaitre dans 'learnContainerByJt > Dépôts'


4- Interface Azure: Création d'une Web App (App service)à partir de l'image    

Container  > App Service    

Nom application: learn-container    
Registre: learnContainerByJt    
Image: webimage    

Si erreur Admin: `az acr update -n learnContainerByJt --admin-enabled true`    

Mon app: https://learn-container.azurewebsites.net    


