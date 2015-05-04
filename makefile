all : synthese Analyseur_Image.class

synthese : synthese.adb
	gnatmake synthese.adb

Analyseur_Image.class : Analyseur_Image.java
	javac -cp . Analyseur_Image.java Matrice.java MatricePPM.java Pixel.java

clean :

	rm -f synthese.o
	rm -f synthese
	rm -f synthese.ali
	rm -f Analyseyr_Image.class