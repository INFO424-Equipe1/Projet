public class MatricePPM {

    private Pixel[][] image;
    private int hauteur;
    private int largeur;
    private int nuances;

    public MatricePPM (String[][] caracteres, String hauteur, 
		       String largeur, String nuances) {
	this.hauteur = Integer.parseInt(hauteur);
	this.largeur = Integer.parseInt(largeur);
	this.nuances = Integer.parseInt(nuances);
	this.image = new Pixel[this.hauteur][this.largeur];
	int cpt =0;
	int r =0;
	int v =0;
	int b =0;
	int x =0;
	int y = 0;
	for (int i=0 ; i<caracteres.length ; i++) {
	    for (int j=0 ; j<caracteres[i].length ; j++) {
		if (cpt==1) {
		    r = Integer.parseInt(caracteres[j][i]);
		    cpt++;
		}
		if (cpt==2) {
		    v = Integer.parseInt(caracteres[j][i]);
		    cpt++;
		}
		if (cpt==3) {
		    b = Integer.parseInt(caracteres[j][i]);
		    this.image[x][y] = new Pixel(r,v,b);
		    x++;
		    cpt = 0;
		}
		else cpt++;
	    }
	    x=0;
	    y++;
	}
	
    }

}