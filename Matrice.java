public class Matrice {
    
    private int[][] image;
    private int hauteur;
    private int largeur;
    private int nuances;
    

    public Matrice() {
	/* Constructeur pour une matrice vide, servant pour des tests 
	 * (temporaire)
	 */

	this.largeur = 300;
	this.hauteur = 200;
	this.nuances = 1;
	this.image = new int[this.hauteur][this.largeur]; 
	for (int i=0 ; i<this.hauteur ; i++) {
	    for (int j=0 ; j<this.largeur ; j++) {
		this.image[i][j] = 0;
	    }
        }
    }

    public Matrice( String[][] caracteres , String largeur_img, String hauteur_img,
		    String nuances_img) {
	/* Constructeur qui récupère les informations de 
	 * l'image à traiter pour créer une Matrice associée
	 * Paramètres : 
	 * caracteres -> tableau bidimensionnel contenant le codage
	 * de l'image à analyser (en String dans l'image)
	 * largeur_img -> String représentant la largeur de l'image 
	 * hauteur_img -> String représentant la hauteur de l'image
	 * nuances_img -> String représentant le nombre de nuances
	 * des couleurs de l'image (utile pour les images.ppm)
	 */

	/* Integer.parseInt("String") permet de tranformer un String en int */
	this.largeur = Integer.parseInt(largeur_img);
      	this.hauteur = Integer.parseInt(hauteur_img);
	this.nuances = Integer.parseInt(nuances_img);
	this.image = new int[this.hauteur][this.largeur];
	for (int i=0 ; i<this.hauteur ; i++) {
	    for (int j=0 ; j<this.largeur ; j++) {
		this.image[i][j] = Integer.parseInt(caracteres[j][i]);
            }
        }
	
    }
       
    public int[][] getImage() {
	return this.image;
    }

    public int getLargeur() {
	return this.largeur;
    }

    public int getHauteur() {
	return this.hauteur;
    }
    
    public int getNuances() {
	return this.nuances;
    }
    
    public void analyse_pgm () {
	/* Procedure qui analyse l'image .pgm 
	 * Affiche les résultats de l'analyse
	 */ 

        if (this.nuances == 1) {
	    // Si on a une image seulement avec du noir et du blanc
	    

	    
	    int h = 0; // Compteur de la largeur de la figure sur une colonne
	    int h_max = 0; // Valeur maximale de la largeur de la figure
	    int l = 0; // largeur de la figure

	    // coordonnées du point d'origine de la figure
	    int x1=0 ;
	    int y1=0 ;
	    
	    // coordonnées du deuxième point de la base (triangle)
	    int x2=0;
	    int y2=0;
	    
	    // coordonnées du sommet du triangle
	    int x3=0;
	    int y3=0;
	    	    	    
	    // Booleens mis à jour si on reconnait la figure
	    boolean estRectangle = false;
	    boolean estCercle = false;
	    boolean estTriangle = false;

	    // ypixel sert à dire si on a commencé à parcourir la figure
	    boolean ypixel = false;

	    // sup sert à savoir si on avait un moment donné h>h_max (élimine le rectangle)
	    boolean sup = false;
	    
	    boolean onaBase = false;
	    
	    // On parcourt notre image
	    
	    for (int j=0; j<this.largeur ; j++) {
		
		for (int i=0; i<this.hauteur ; i++) {
		    

		    
		    if (this.image[i][j] == 0) {
			// Si on a un pixel noir
			h++ ;
			ypixel = true;
			if (x1==0 && y1==0) {
			    // on regarde le premier point de la figure
			    x1 = j;
			    y1 = i;
			    if (this.image[i+1][j+1] == 0 && onaBase) {
				onaBase = true;
			    }
			    else{
				onaBase=false;
			    }
			}
			if (this.image[i][j+1] == 1) {
			    
			    x3 = j;
			    y3 = i;
			}
			if (this.image[i+1][j] == 1){
			    // Si on arrive à la fin de la figure
			    // sur la colonne courante
			    // on incrémente la largeur de cette figure
			    l++;
			}
			if (h == 1 && this.image[i+1][j] == 1) {
			    // Si on arrive à la fin d'une colonne et qu'on avait qu'un pixel de couleur
			    // cela signifie qu'on a trouvé le dernier point de la figure
			    // (troisième sommet du triangle)
			    
			    x2 = j;
			    y2 = i;
			}
			
		    }
		    
		    
		    
		}
		if (h == h_max && ypixel && ! sup && ! estTriangle) {
		    // Si on a deux colonnes de même longueur qui se suivent
		    // on a un rectangle
		    estRectangle = true;
		    		}
		if (h > h_max) {
		    // On met à jour la hauteur maximale
		    h_max = h ;
		    if (l>1) {
			sup = true;
		    }
		}
		if (sup && h < h_max && ! estRectangle && onaBase) {
		    // Si la hauteur courante est inférieur à la hauteur max
		    // on a un triangle
		    estTriangle = true;
		}
		
		
    		// On arrive à une nouvelle colonne
    		h = 0 ;
	    }
    	    
	    
	    if (estRectangle) {
		// Si on a un rectangle
		if (h_max == l) {
		    // Le cas d'un carré
		    System.out.println("La figure est un carré");
		}
		else {
		    System.out.println("La figure est un rectangle");
		}
		System.out.println("Point origine : ("+x1+","+y1+")");
		System.out.println("Couleur : Noir");
		System.out.println("Largeur : "+l);
		System.out.println("Hauteur : "+h_max);
	    }
	    else{

		if (estTriangle) {
		    // Si on a un triangle
		    System.out.println("La figure est un triangle");
		    System.out.println("Sommet 1 : ("+x1+","+y1+")");
		    System.out.println("Sommet 2 : ("+x2+","+y2+")");
		    System.out.println("Sommet 3 : ("+x3+","+y3+")");
		    System.out.println("Couleur : Noir");
		    System.out.println("Longueur de la base : "+h_max);
		    System.out.println("Hauteur : "+l);
		}
		else{
		    // Si on a un cercle
		    System.out.println("La figure est un cercle");
		    System.out.println("Couleur : Noir");
		    int centrex = x1+l/2;
		    System.out.println("Centre : ("+centrex+","+y1+")");
		    int rayon = h_max/2;
		    System.out.println("Rayon : "+rayon);
		}
	    }
     
	}
    
    
    } 
    
    public void analyse_ppm () {
	/* Procedure qui analyse l'image .ppm 
	 * Affiche les résultats de l'analyse
	 */ 

    }


}