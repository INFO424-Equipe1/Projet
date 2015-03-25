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
		this.image[i][j] = Integer.parseInt(caracteres[i][j]);
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
	    

	    
	    int l = 0; // Compteur de la largeur de la figure sur une ligne
	    int l_max = 0; // Valeur maximale de la largeur de la figure
	    int h = 0; // hauteur de la figure
	    // coordonnées du point d'origine de la figure
	    int x=0 ;
	    int y=0 ; 
	    
	    // Booleens mis à jour si on reconnait la figure
	    boolean estRectangle = false;
	    boolean estCercle = false;
	    boolean estTriangle = false;

	    // On parcourt notre image
	    for (int i=0; i<this.hauteur ; i++) {
       
		for (int j=0; j<this.largeur ; j++) {
    		    if (this.image[i][j] == 0) {
			// Si on a un pixel noir
			l++ ;
    			if (x==0 && y==0) {
    			    // on regarde le premier point de la figure
    			    x = j;
    			    y = i;
    			}
			if (j == this.largeur-1 || this.image[i][j+1] == 1) {
			    // Si on arrive à la fin de la figure
			    // sur la ligne courante
			    // on incrémente la hauteur de cette figure
			    h++;
			}
		    }   
        	}
		if (l == l_max) {
		    // Si on a deux lignes de même longueur qui se suivent
		    // on a un rectangle
		    estRectangle = true;
		}
		if (l > l_max) {
		    // On met à jour la ligne maximale
    		    l_max = l ;
    		}
	       
    		// On arrive à une nouvelle ligne
    		l = 0 ;
    	    }
	    
	    if (estRectangle) {
		// Si on a un rectangle
		if (l_max == h) {
		    // Le cas d'un carré
		    System.out.println("La figure est un carré");
		}
		else {
		    System.out.println("La figure est un rectangle");
		}
		System.out.println("Point origine : ("+x+","+y+")");
		System.out.println("Couleur : Noir");
		System.out.println("Largeur : "+l_max);
		System.out.println("Hauteur : "+h);
	    }
     
	}
    
    
    } 
    
    public void analyse_ppm () {
	/* Procedure qui analyse l'image .ppm 
	 * Affiche les résultats de l'analyse
	 */ 

    }


}