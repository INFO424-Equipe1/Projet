import java.io.*;
import java.util.Scanner;

public class Analyseur_Image {


	/* Classe principale
	** Analyse d'une image en .pgm
	*/
	
        public static void main(String[] args){ 

	    /* 
	    **  Récupération de l'image (lecture et stockage)  
	    */

	    // On ouvre l'entrée
	    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	    
	    
	    // format_img va stocker le numero magique lié au format (p1, p2 ...)
	    String format_img = null; 

	    try {
		format_img = br.readLine();
		format_img.replaceAll( "\\s+", " ");
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
	    String[][] caracteres = null;
	    if (format_img.equals("P2")) {
		    caracteres=
			new String[Integer.parseInt(dimension[0])][Integer.parseInt(dimension[1])];    

		    // fin devient true quand on a terminé
		    boolean fin = true;
	    
	   
		    int h =0;
		    while ( fin && h < Integer.parseInt(dimension[1]) ) {
			try {
			    int l = 0;
		    
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
				fin = false;
			    }
			} catch (IOException ioe) {
			    System.out.println( "Erreur de lecture" );
			    System.exit(1);
			}


		    }
		}

		else { 
		    if (format_img.equals("P3")) {
			    
			    caracteres =
			    new String[Integer.parseInt(dimension[0])*3][Integer.parseInt(dimension[1])];    

			    // fin devient true quand on a terminé
			    boolean fin = true;
			    
			    
			    int h =0;
			    while ( fin && h < Integer.parseInt(dimension[1]) ) {
				try {
				    int l = 0;
				    
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
					fin = false;
				    }
				} catch (IOException ioe) {
				    System.out.println( "Erreur de lecture" );
				    System.exit(1);
				}
				
				
			    }
			}
			}


	    // mat va stocker notre image (en transformant les string en int)
	    Matrice mat = null;
	    MatricePPM mat_ppm = null;
	    if (format_img.equals("P2")) {
		mat = new Matrice( caracteres, dimension[0] , dimension[1]
				       , nuances_img);
	    }
	    else {
		mat_ppm = new MatricePPM( caracteres, dimension[0] , dimension[1]
				       , nuances_img );
	    }
		
	    
	    
	    /*
	    ** Analyse de l'image
	    */ 

	    System.out.println("--- Analyse de l'image ---");
	    System.out.println();
	    System.out.println("   Image   ");
	    System.out.println("Format : "+format_img);
	    System.out.println("Dimension : "+dimension[0]+" par "+dimension[1]);
	    System.out.println("Nuances : "+nuances_img);
	    System.out.println();
	    System.out.println("Résultats de l'analyse :");
	    
	    // On regarde le format de l'image 
	    if (format_img.equals("P2")) {
		// Si l'image est en pgm (nuances de gris)
		mat.analyse_pgm();
		System.out.println("Analyse terminée ");
	    }

	    else {
		if (format_img.equals("P3")) {
     		    // Si l'image est en ppm (couleurs)
		    mat_ppm.analyse_ppm();
		    System.out.println("Analyse terminée ");
		}

		else {
		    // Format d'image non supporté ou inexistant
		    System.out.println("Format d'image non supporté");
		    System.exit(1);
		}
	    }
	    
	    

	}

}
 
