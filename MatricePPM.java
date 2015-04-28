public class MatricePPM {

    private Pixel[][] image;
    private int hauteur;
    private int largeur;
    private int nuances;

    public MatricePPM (String[][] caracteres, String largeur, 
		       String hauteur, String nuances) {
	this.hauteur = Integer.parseInt(hauteur);
	this.largeur = Integer.parseInt(largeur);
	this.nuances = Integer.parseInt(nuances);
	this.image = new Pixel[this.hauteur][this.largeur];
	int cpt =0;
	int r =0;
	int v =0;
	int b =0;
	int x =0;
	int y =0;
	for (int i=0 ; i<this.hauteur; i++) {
	    for (int j=0 ; j<(this.largeur*3) ; j++) {
		if (cpt==0) {
		    r = Integer.parseInt(caracteres[j][i]);
		    cpt++;
		}
		else if (cpt==1) {
		    v = Integer.parseInt(caracteres[j][i]);
		    cpt++;
		}
		else if (cpt==2) {
		    b = Integer.parseInt(caracteres[j][i]);
		    this.image[i][x] = new Pixel(r,v,b);
		    cpt = 0;
		    x++;
		}
		else cpt++;
	    }
	    x=0;
	    
	}
	
    }

    public void analyse_ppm() {
	
	/* Procedure qui analyse l'image .ppm 
	 * Affiche les résultats de l'analyse
	 */ 
 
	/* 
	 *  Variables
	 */ 
	    
	int h = 0; // Compteur de la largeur de la figure sur une colonne
	int h_max = 0; // Valeur maximale de la largeur de la figure
	int l = 0; // largeur de la figure
	
	Pixel fond= new Pixel() ; // Enregistre la couleur du fond
	Pixel couleur_fig = new Pixel(); // Enregistre la couleur de la figure

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
	
	// sup sert à savoir si on avait à un moment donné h>h_max (élimine le rectangle)
	boolean sup = false;
	
	// onaBase sert à différencier le triangle et le cercle. Si on a une base, 
	// on a un triangle
	boolean onaBase = false;
	
	// ysommet sert pour trouver le sommet supérieur du triangle
	boolean ysommet = false;
	
	
	/*
	 *  Parcours de l'image
	 */ 
	
	// On parcourt en colonnes ( j -> colonnes, i -> lignes)
	// pour faciliter l'analyse
	for (int j=0; j<this.largeur ; j++) {
	    for (int i=0; i<this.hauteur ; i++) {
		if (fond.getR() == 5 && fond.getV() == 5 && fond.getB() == 5) {
		    // On enregistre la couleur de fond (Hypothèse: pas de figure en (0,0)) 
		    fond.setR( this.image[i][j].getR() );
		    fond.setV( this.image[i][j].getV() );
		    fond.setB( this.image[i][j].getB() );
		}
		
		if (!(this.image[i][j].couleur().equals(fond.couleur()))) {
		    // Si on a un pixel différent du fond (début de la figure)
		    
		    // On conserve la couleur de la figure
		    couleur_fig.setR( this.image[i][j].getR() );
		    couleur_fig.setV( this.image[i][j].getV() );
		    couleur_fig.setB( this.image[i][j].getB() );
		    h++ ;
		    ypixel = true;
		    if (x1==0 && y1==0) {
			// on regarde le premier point de la figure
			x1 = j;
			y1 = i;   
		    }
		    if ( this.image[y1][x1+1].couleur().equals(couleur_fig.couleur()) && 
			 this.image[y1+1][x1+1].couleur().equals(fond.couleur()) ) {
			// On regarde (pour le triangle) si le point suivant sur la ligne
			// correspond à la continuité de la base de la figure
			onaBase =true;
		    }
		    
		    if (this.image[i+1][j].couleur().equals(fond.couleur()) ) {
			// Si on arrive à la fin de la figure
			// sur la colonne courante
			// on incrémente la largeur de cette figure
			l++;
			
		    }
		    
		    if (h == 1 && this.image[i+1][j].couleur().equals(fond.couleur()) ) {
			// Si on arrive à la fin d'une colonne et qu'on avait qu'un pixel de couleur
			// cela signifie qu'on a trouvé le dernier point de la figure
			// (troisième sommet du triangle)
			
			x2 = j;
			y2 = i;
		    }
		}
		   		
	    }
	    
	    if (h == h_max && ! sup && ! estTriangle && ypixel) {
		// Si on a deux colonnes de même longueur qui se suivent
		// on a un rectangle
		estRectangle = true;
	    }
	    
	    if (sup && h < h_max && ! estRectangle && onaBase) {
		// Si la hauteur courante est inférieur à la hauteur max
		// on a un triangle
		estTriangle = true;
		
	    }
	    
	    if (h<h_max && sup && ! ysommet) {
		// On cherche le sommet supérieur du triangle
		x3 = j-1;
		y3 = y1-h_max+1;
		ysommet = true;
	    }
	    if (h > h_max) {
		// On met à jour la hauteur maximale
		h_max = h ;
		if (l>1) {
		    sup = true;
		}
	    }
	    
	    
	    
	    
	    
	    // On arrive à une nouvelle colonne
	    h = 0 ;
	}
    	
	System.out.println("Couleur de fond de l'image : "+fond.couleur());
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
	    System.out.println("Couleur : "+couleur_fig.couleur());
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
		System.out.println("Couleur : "+couleur_fig.couleur());
		System.out.println("Longueur de la base : "+l);
		System.out.println("Hauteur : "+h_max);
	    }
	    
	    else{
		// Si on a un cercle
		System.out.println("La figure est un cercle");
		System.out.println("Couleur : "+couleur_fig.couleur());
		int centrex = x1+l/2;
		System.out.println("Centre : ("+centrex+","+y1+")");
		int rayon = h_max/2;
		System.out.println("Rayon : "+rayon);
	    }
	}  
    } 

}