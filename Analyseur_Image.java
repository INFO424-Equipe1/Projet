import java.io.*;
import java.util.Scanner;

public class Analyseur_Image {


	/* Classe principale
	** Analyse d'une image en .pgm
	*/
	
        public static void main(String[] args){ 

	    // On ouvre l'entrée
	    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	    // format_img va stocker le numero magique lié au format (p1, p2 ...)
	    try {
		String format_img = br.readLine();
	    } catch (IOException ioe) {
		System.out.println( "Erreur de lecture" );
		System.exit(1);
	    }

	    // ligneCourante va stocker la ligne lue
	    String ligneCourante = null;

	    // dimension va stocker les dimensions de l'image
	    String[] dimension = new String[2];
	    
	    try {
		ligneCourante = br.readLine();
		ligneCourante.replaceAll( "\\s+", " ");
		int i =0;
		for (String s : ligneCourante.split( " " ) ) {
		    if (s.length() > 0 ) {
			dimension[i] = s;
			i++;
		    }
		}
	    } catch (IOException ioe) {
		System.out.println( "Erreur de lecture" );
		System.exit(1);
	    }
	    
	    // nuances_img va stocker le nombre des nuances de l'image
	    String nuances_img = "";
	    try {
		ligneCourante = br.readLine();
		nuances_img = ligneCourante.replaceAll( "\\s+", " ");
	    } catch (IOException ioe) {
		System.out.println( "Erreur de lecture" );
		System.exit(1);
	    }
	    

	    // caracteres va stocker le codage de l'image 
	    String[][] caracteres = new String[Integer.parseInt(dimension[2])][Integer.parseInt(dimension[1])];	    
	    // fin devient true quand on a terminé
	    boolean fin = false;
	    
	    int l = 0;
	    int h = 0;
	    
	    while ( ! fin ) {
		try {
		    ligneCourante = br.readLine();
		    if ( ligneCourante != null ) {
			ligneCourante.replaceAll( "\\s+", " ");
			for ( String c : ligneCourante.split( " " ) ) {
			    if (c.length() > 0) {
				caracteres[l][h] = c;
				l++;
			    }
			}
		    
			h++;

		    }
		
		    else {
			fin = true;
		    }
		} catch (IOException ioe) {
		    System.out.println( "Erreur de lecture" );
		    System.exit(1);
		}


	    }

	    // mat va stocker notre image (en transformant les string en int)
	    Matrice mat = new Matrice( caracteres, dimension[2] , dimension[1]
					   , nuances_img );
		



	}

}
 
