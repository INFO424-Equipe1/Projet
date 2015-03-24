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
    
    public static void analyse_pgm () {
	/* Procedure qui analyse l'image .pgm 
	 * Affiche les résultats de l'analyse
	 */ 

	if (this.nuances == 1) {
	    // Si on a une image seulement avec du noir et du blanc
	    
	    int l = 0;
	    int l_max = 0;
	    int h = 0;
	    // On parcourt notre image
	    for (int i=0; i<this.hauteur ; i++) {
       
		for (int j=0; j<this.largeur ; j++) {
		    if (this.image[i][j] == 0) {
			l++ ;
			
		    }
		    if (j == this.largeur -1) {
		        h++;
			    
		    }
				    
	    	}

		if (l > l_max) {
		    l_max = l ;
		}
		l = 0 ;
	    }

	    if (l_max = l) {
		
	}


    }
    
    public static void analyse_ppm () {
	/* Procedure qui analyse l'image .ppm 
	 * Affiche les résultats de l'analyse
	 */ 

    }


}