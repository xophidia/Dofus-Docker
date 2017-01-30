##Docker linux pour Symbioz##

Symbioz est un émulateur dofus 2.30 écrit par Skinz3 [https://github.com/Skinz3/Symbioz]() en C#.

###Installation###

```
docker build -t dofusDocker:0.1 .
```

Installation :
 
 - mono-complete
 - mysql-server
 - Symbioz
 - git, unzip

Pour lancer l'émulateur :

```
mono /home/Symbioz/Symbioz/bin/Debug/Symbioz.exe
```

Pour créer un compte utilisateur (dofus/dofus):

```
mysql -e "insert into accounts values (2,"dofus","dofus","dofus",5,False,5,20,1,null);"
```
ou

```
mysql
connect dofus
insert into accounts values (2,"dofus","dofus","dofus",5,False,5,20,1,null);
```


###Configuration ###
Le fichier config.xml dans le même repertoire contient des éléments à modifier.

```xml
<Configuration>
  <CyclicSaveInterval>80</CyclicSaveInterval>
  <DatabaseHost>192.168.0.100</DatabaseHost>
  <DatabaseUser>root</DatabaseUser>
  <DatabasePassword></DatabasePassword>
  <DatabaseName>dofus</DatabaseName>
  <ServerId>31</ServerId>
  <AuthPort>443</AuthPort>
  <WorldPort>5555</WorldPort>
  <StartLevel>100</StartLevel>
  <StartMapId>54172969</StartMapId>
  <StartCellId>300</StartCellId>
  <DutyMapId>99091983</DutyMapId>
  <DutyCellId>300</DutyCellId>
  <StartKamas>0</StartKamas>
  <WelcomeMessage>SymbiozEmu version 0,9</WelcomeMessage>
  <ShowProtocolMessages>True</ShowProtocolMessages>
  <KamasDropRatio>1</KamasDropRatio>
  <ExperienceRatio>1</ExperienceRatio>
  <StartBankKamas>0</StartBankKamas>
  <Host>192.168.0.100</Host>
  <IsCustomHost>False</IsCustomHost>
  <RealHost />
  <SafeRun>False</SafeRun>
</Configuration>
```
### Utilisation ####

Se référer au lien du créateur de l'emulateur pour obtenir le client dofus permettant la connexion au docker.
Le fichier dofus_ID contient les id des items présent sur le jeu.




### [TODO] ###

 - L'emulateur ne fonctionne pas "encore" car son code source doit être modifié pour prendre en compte l'arborescence de linux et eviter ce type d'erreur : (update dès que je trouve un windows !)

```
"/home/Symbioz/Symbioz/bin/Debug\lang.d2i"
```

 - Ajout des commandes permettant de lancer le docker avec une IP externe et lancement de l'emulateur.

###Avertissement ###

Si vous avez cette erreur lors de l'installation :

```
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
```

```
connectez vous sur le docker et tapez
service mysql stop
puis relancez le script
```
