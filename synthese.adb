WITH Ada.Text_IO;
WITH Ada.Integer_Text_IO ; 
USE Ada.Text_IO;
USE Ada.Integer_Text_IO ;

procedure synthese is
	
	
	n,m,x,y,Ax,Ay,Bx,By,longeur,largeur,rayon:Integer;
	Nomf: String:= " ";
	
	
	type Forme is (Rectangle,Triangle,Cercle);
	
	type Matrice is array(0..n,1..m) of integer;
	image : matrice;
	
   procedure Dessin_Rectangle(x1,y1,longrec,Largrec:in Integer) is 
      begin
   	for i in x1..x1+longrec loop
   		for j in y1..y1+largrec loop
   			image(i,j):=0;
   		end loop;
   	end loop;
      end Dessin_Rectangle;
      
      

   begin
    for i in 0..n loop
    	for j in 0..m loop
    		image(i,j):=1;
    	end loop;
    end loop;
    put("Donner le point initial de la figure");
    Get( X);get(Y);
    put("Donner le nom de la figure");
    get (nomf);
    if nomf = "Rectangle"
    	then put("Donner la longeur et la largeur");
	get (Longeur) ;get (Largeur);
	Dessin_Rectangle (X,Y,longeur, Largeur);
    	else if nomf = "Triangle"
    		then put ("Donner les coordonées de la base  ");
    		get (Ax,Ay);get(Bx,By);
		Dessin_Triangle((x,y),(Ax,Ay),(Bx,By));
    	else put ("Donner le rayon du cercle");
	get (Rayon);
	end if;
	end if;
	
    end synthese;




