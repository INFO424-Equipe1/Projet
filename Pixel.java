public class Pixel {

    private int r;
    private int v;
    private int b;


    public Pixel() {
	this.r = 5;
	this.v = 5;
	this.b = 5;
    }
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
    public int getR() {
	return this.r;
    }
    public int getV() {
	return this.v;
    }
    public int getB() {
	return this.b;
    }
    public void setR(int r) {
	this.r = r;
    }
    public void setV(int v) {
	this.v = v;
    }
    public void setB(int b) {
	this.b = b;
    }
}