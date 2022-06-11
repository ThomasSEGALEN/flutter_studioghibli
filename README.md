# Flutter - Studio Ghibli App

## Sommaire

1. [Définition du projet](README.md#1-Définition-du-projet-)
2. [Rendu attendu](README.md#2-rendu-attendu-)
3. [Notation](README.md#3-notation-)
4. [Version Flutter/Dart](README.md#4-version-flutterdart-)
5. [Fonctionnalités](README.md#5-fonctionnalités-)
6. [API](README.md#6-api-)

## 1. Définition du projet :

- Projet individuel
- Utilisation d'API distantes au choix (météo, transport, sport, films, images, etc.)
- Minimum 3 écrans ou onglets avec au moins 1 navigation entre écrans
- Utilisation d'un système de persistance des données
- Utilisation d'un state management global
- Libre d'utiliser des packages

## 2. Rendu attendu :

- Accès aux sources via GIT (GitLab, GitHub, etc.)
- Fichier readme.md avec, au minimum, les informations suivantes :
    - la version de Flutter/Dart utilisée
    - les fonctionnalités de l'application
    - les API utilisées
- Projet à rendre avant le dimanche 12 juin minuit

## 3. Notation :

Pour la notation, les éléments suivants seront pris en compte :
- application fonctionnelle
- respect des consignes
- qualité du code
- architecture de l'application
- erreurs/warnings remontés par Dart Analysis
- fonctionnalités
- design de l'application

## 4. Version Flutter/Dart :

Flutter **3.0.1**  
Dart SDK **2.17.1**

## 5. Fonctionnalités :

L'application possède 3 écrans :
- Accueil
- Détails
- Favoris  
  
Sur l'écran d'Accueil, une liste de tous les films du **Studio Ghibli** apparaît. En cliquant sur l'un des films listés, vous êtes redirigés sur la page Détails qui comporte les informations du film. Vous avez aussi la possibilité d'ajouter les films à votre liste de favoris, celle-ci s'affiche dès le moment où vous en ajouter un. Dans cet écran Favoris vous avez encore une fois accès aux détails de vos films, mais vous pouvez aussi enlever la totalité de vos favoris en un clic. L'application possède un splash screen et deux thèmes, synchronisés avec l'appareil, afin de la rendre plus esthétique. Elle est aussi équipée d'un stockage local, après avoir ajouté un ou plusieurs favoris vous pouvez quitter l'application sans craindre de perdre votre liste de favoris.

## 6. API :

Pour réaliser ce projet, j'ai utilisé l'API [Studio Ghibli](https://ghibliapi.herokuapp.com/).
  
