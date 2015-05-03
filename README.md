# Projet
Toute la documentation pour le projet

Instructions :
 - Se placer dans le répertoire prévu pour le Projet
 - Importer le projet
	$ git clone https://github.com/INFO424-Equipe1/Projet.git
 - Se placer dans Projet
 - Importer les fichiers
	$ git pull
 - Compilation 
	$ make
 - Execution
	Pour la synthèse :

	$ ./synthese --taille largeur hauteur --forme_de_la_figure points_déterminants --Couleur de la figure> image.ppm

	ex :  $ ./synthese --taille 100 50 --Cercle 10 10 3 --Rouge
	forme un cercle centré en 10 10 et de rayon 3 de couleur rouge, dans une image de taille 100 par 50

	ex : $ ./synthese --taille 100 100 --Rectangle 10 10 20 30 --Vert
	forme un rectangle avec pour origine le point (10,10) de hauteur 20 et de largeur 30 de couleur verte

	ex : $ ./synthese --taille 100 100 --Triangle 10 5 40 5 20 20 --Jaune
	forme un Triangle qui a pour sommets les points (10,5) , (40,5) et (20,20) de couleur Jaune



	Pour l'analyse :
	$ java -cp . Analyseur_Image < image.ppm
