SOUAIBY Christina

> Environnement Prérequis : Maven, MySQL (+ potentielles extensions qui accompagnent)

> Tout d'abord, il faut exécuter le fichier sql Winery.sql qui va importer dans votre environnement la base de données MySQL dont vous aurez besoin dans le projet.  Il se peut que vous ayez à modifier vos paramètres MySQL pour réussir la connexion.

Paramètres :

Port : 3306
username : root
password : root
 

> Pour compiler le code, il faut :
  > dans un terminal, aller vers l'emplacement .../POA-VirtualWinerySwing/src/main/java 
  > puis taper et lancer la commande javac *.java
  > revenir en arrière vers .../POA-VirtualWinerySwing
  > puis taper et lancer la commande mvn clean install ou mvn clean package pour mettre à jour le fichier jar

> Ensuite, Pour exécuter le code, il faut : 

  > lancer la commande mvn exec:java

OU
  
  > avancer vers .../POA-VirtualWinerySwing/target
  > puis taper et lancer la commande java -jar POA-VirtualWinerySwing-1.0-SNAPSHOT.jar

> Il est possible d'exécuter directement l'application en lançant la copie du JAR déposée dans le fichier principal, à condition d'avoir bien importé la base de donnée avec les identifiants correctement paramétrés. 
