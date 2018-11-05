# LE CLUB TRES SELECT DU BOUTON START



![THP-BDX-LOGO](http://image.noelshack.com/fichiers/2018/45/1/1541412703-thpbdx1.png)



---

## 1.DISCLAIMER



---

## 2.INFORMATIONS



Le but du projet **THP - Semaine 6, Jour 1** est de _créer une application simple et d'effectuer des tests sur l'application en utilisant **MiniTests**_.



---

## 3.POUR COMMENCER



1. `bundle install` 

2. 

3. 

4. 



---

## 4.CAHIER DES CHARGES



###### A.Création de l'application - club select

1. Comprend des **Users** comprenant Prénom, Nom, Email ( ne pouvant être _blank_ ), attributs demandés lors du **Sign Up** ✔

2. Comprend un système de **Session** simple ✔

3. Une **Home Page** proposant un **Login / Sign  Up** ; si un **User** est connecté, lui proposer un lien vers la **Club Page** ✖

4. Une **navbar** redirigeant vers la **Home Page** ; si un **User** est connecté, elle contient un lien vers la **Club Page**, sinon elle propose un **Login / Sign Up** ✖

5. Une **Club Page** montrant la liste des **Users** ainsi que leurs informations ; tenter d'y accéder sans être connecté redirige vers **Login / Sign Up** ✖



###### B.Tests à l'aide de MiniTests

1. Tester les modèles :

* Impossible de créer un **User** en base avec un prénom vide ✖

* Impossible de créer un **User** en base avec un prénom ne contenant que des espaces ✖

* Impossible de créer un **User** ayant le même email qu'un autre **User** ✖

2. Tester les views : 

* La **Home Page** affiche bien **Login / Sign Up** si il n'y a pas de **User** connecté ✖

* La **Home Page** affiche bien un lien vers **Club Page** si il y a un **User** connecté ✖

* Le **Sign Up** retourne une erreur si le prénom, le nom ou l'email est invalide ✖

* Le **Login** connecte la personne si elle rentre un bon ID, lui renvoie un message d'erreur si elle ne renvoie pas un bon paramètre ✖

* La **navbar** affiche bien **Login / Sign Up** si il n'y a pas de **User** connecté ✖

* La **navbar** affiche bien un lien vers **Club Page** si il y a un **User** connecté ✖

* La **Club Page** affiche bien la liste des personnes inscrites au site ✖

* Tenter d'accéder à la **Club Page** sans être connecté renvoie au **Login / Sign Up** ✖



###### C.Implémentation d'une feature - page de profil

1. **TDD**

* Un lien **Show Page** accessible aux utilisateurs connectés ✖

* La **Show Page** affiche les informations de l'utilisateur ✖

* Tenter d'accéder à la **Show Page** sans être connecté renvoie au **Login / Sign Up** ✖

* Tenter d'accéder à une **Show Page** ne correspondant pas au **User** connecté redirige vers la **Home Page** et précise que l'accès au contenu est restreint ✖

2. **Création**

* Création de la **Show Page**, affichant les informations du **User** connecté ✖



###### D.Implémentation d'une feature - modifier son profil

1. **TDD**

* Le formulaire **Edit** renvoie une erreur si le prénom, nom ou email est invalide ✖

* Tenter d'accéder à la **Edit Page** sans être connecté renvoie vers le **Login / Sign Up** ✖

* Tenter d'accéder à la **Edit Page** d'un autre profil que le sien renvoie vers la **Home Page** et précise que l'accès au contenu est restreint ✖



2. **Création**

* Création de la **Edit Page** comprenant un formulaire pour modifier ses informations ✖

* Rendre la **Show Page** d'un autre **User** disponible pour les autres **Users** connectés ✖

* Sur la **Club Page**, chaque **User** de la liste aura un lien vers sa **Show Page** ✖



---

## 5.DEROULEMENT DU PROJET



1. Nous avons décidé d'utiliser un `rails g scaffold users` pour faciliter la création de controllers, routes, views, tests, etc. 

2. **_(Optionnel ?)_** Nous avons installé la **gem** `bcrypt` et créé un modèle sécurisé de _password_ en se servant du cours __THP__ (_S5,J5_)

3. Nous avons créé un système de **Session** en se servant du cours __THP__ (_S5,J5_)

4. Nous avons réalisé des `static_pages` `#home`

5. 



---

## 6.PRESENTATION DE L'EQUIPE



Voici les membres de l'équipe **The Hacking Project, Section Bordeaux, Session 6, Groupe 1, Division Linux :** 



* **Paul Guérin**, `47 ans, soon-to-be 1001% Binding of Isaac`

* **David Rangeard**, `98 ans, futur assassin de voleurs de vélos`

* **Valérian Michelot**, `4 ans, cousin éloigné de l'ours en hibernation`