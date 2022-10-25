# learn-az-container
## https://learn.microsoft.com/fr-fr/training/modules/deploy-run-container-app-service/      

Test and Try Registry AZ    
  
### 1- Interface Azure: Création d'un Container registry
    
Nom du Registre de containers:    
learnContainerByJt.azurecr.io    
    
### 2- Dans Cloud Shell    
    
Cette commande envoie le contenu du dossier au registre de conteneurspar me biais d'un agent, qui utilise les instructions du fichier Docker pour générer l’image `learnContainerByJt` et la stocker.
```
git clone https://github.com/jt-tokeosoftware/learn-az-container.git
cd ~/learn-az-container
az acr build --registry learnContainerByJt --image webimage .
```

### 3- Interface Azure: Vérifier dans le Registre de container   
   
L'image Docker `webimage` doit apparaitre dans 'learnContainerByJt > Dépôts'


### 4- Interface Azure: Création d'une Web App (App service)à partir de l'image    

Container  > App Service    

Nom application: learn-container    
Registre: learnContainerByJt    
Image: webimage    

Si erreur Admin: `az acr update -n learnContainerByJt --admin-enabled true`    

### 5- Mon app: 
https://learn-container.azurewebsites.net    


### 6- CI avec une tâche Azure Container Registry    

. Chaque fois qu’un changement est validé, la tâche génère l’image Docker webimage à partir du code source dans GitHub et la stocke dans votre registre dans Container Registry.    

Avant d’exécuter cette commande, vous devez créer un jeton d’accès personnel GitHub avec des autorisations pour créer un webhook dans votre référentiel. 

https://github.com/settings/tokens     

Ex access token: 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    

`az acr task create --registry learnContainerByJt --name buildwebapp --image webimage --context https://github.com/jt-tokeosoftware/learn-az-container.git --file Dockerfile --git-access-token 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`

### 7- Configurer le déploiement continu et créer un webhook
[NE SERT A RIEN - CAR LE WEBHOOK EST SUR LE MICROSOFT REGISTRY]
https://learn.microsoft.com/fr-fr/training/modules/deploy-run-container-app-service/7-exercise-update-web-app?pivots=javascript

Paramètres > sous Paramètres du registre >  Déploiement continu >  Activé

Ce paramètre configure un webhook utilisé par Container Registry pour avertir l’application web que l’image Docker a changé.


### 8- Modifier source et mettre à jour l'app

git pull
```
cd ~/learn-az-container
az acr build --registry learnContainerByJt --image webimage .
``

### 9- Création de la tâche de génération

https://learn.microsoft.com/fr-fr/azure/container-registry/container-registry-tutorial-build-task

Github nouveau token: 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    

```
ACR_NAME=learnContainerByJt        # The name of your Azure container registry
GIT_USER=jt-tokeosoftware      # Your GitHub user account name
GIT_PAT=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 # The PAT you generated in the previous section
```

```
az acr task create \
    --registry learnContainerByJt \
    --name taskupdatecontainer \
    --image webimage:{{.Run.ID}} \
    --context https://github.com/jt-tokeosoftware/learn-az-container \
    --file Dockerfile \
    --git-access-token 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
```

Tester la tâche de génération

```
az acr task run --registry learnContainerByJt --name taskupdatecontainer
```
