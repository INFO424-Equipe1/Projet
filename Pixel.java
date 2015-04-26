public class Pixel {

    private int r;
    private int v;
    private int b;

    public Pixel(int r, int v, int b) {
	this.r = r;
	this.v = v;
	this.b = b;
    }
    
    public String couleur() {
	if (this.r == 0 && this.v == 0 && this.b == 0) {
	    return "Noir" ;
	}
        if (this.r == 255 && this.v == 255 && this.b == 255) {
	    return "Blanc" ;
	}
	if (this.r == 0 && this.v == 0 && this.b == 0) {
	    return "Noir" ;
	}
	if (this.r == 255 && this.v == 0 && this.b == 0) {
	    return "Rouge" ;
	}
	if (this.r == 0 && this.v == 255 && this.b == 0) {
	    return "Vert" ;
	}
	if (this.r == 0 && this.v == 0 && this.b == 255) {
	    return "Bleu" ;
	}
	if (this.r == 255 && this.v == 255 && this.b == 0) {
	    return "Jaune" ;
	}
	else {
	    return "Couleur inconnue" ;
	}
    }

}