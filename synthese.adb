WITH Ada.Text_IO;
WITH Ada.Integer_Text_IO ; 
USE Ada.Text_IO;
USE Ada.Integer_Text_IO ;
WITH Ada.Strings.Unbounded.Text_Io;
USE Ada.Strings.Unbounded.Text_Io;

procedure synthese is
	
	
   n,m,x,y,Ax,Ay,Bx,By,Cx,Cy,longeur,largeur,rayon:Integer;
 
   nomf : String(1..255);
   longueur : Natural;
   
	
   type Forme is (Rectangle, Triangle ,Cercle);
   package Forme_Io is new Enumeration_Io(Forme);
   use Forme_Io;
	
   type Matrice is array(0..8,0..8) of integer;
   image : matrice;
	
   procedure Dessin_Rectangle(x1,y1,longrec,Largrec:in Integer) is 
   begin
      
   	for i in x1..(x1+Longrec) loop
   		for j in y1..y1+largrec loop
   			image(i,j):=0;
   		end loop;
   	end loop;
   end Dessin_Rectangle;
   
      
      
   procedure Dessin_Triangle (x1,Y1,X2,Y2,X3,Y3: in Integer) is
      P,D:Integer;
	 
   begin
      --Si la base est AB
      --construction de la base
       if y1=y2 then
	 for I in X1..X2 loop
	    Image(I,Y1):=0;
	 End loop;
	 --on charche l'équation de la droite AC
	 P:=((Y3-Y1)/(X3-X1));
	 D:=Y1 - P*X1;
	 --Si Ax<Cx on trace une droite AC en incrémentant de A à C
	 if X1<X3 then
	    
	    for I in (X1+1)..X3 loop
	       Image(I,(P*I + D)):=0;
	    End loop;
	    --si Ax>Cx on trace une droite en incrémentant de C à A
	 else   
	     for I in (X3+1)..X1 loop 
	       Image(I,(P*I + D)):=0;
	     End loop;
	 end if;
	 
	 -- on cherche l'équation de la droite BC
	 P:=((Y3-Y2)/(X3-X2));
	 D:=Y2 - P*X2;
	 --Si Bx<Cx on trace une droite BC en incrémentant de B à C
	 if X2<X3 then
	    
	    for I in (X2+1)..X3 loop 
	       Image(I,(P*I + D)):=0;
	    End loop;
	     --si Bx>Cx on trace une droite en incrémentant de C à B
	 else
	    for I in (X3+1)..X2 loop 
	       Image(I,(P*I + D)):=0;
	    End loop;
	 end if;
	 
	   
      elsif y1=y3 then
	 for I in X1..X3 loop
	    Image(I,Y1):=0;
	 End loop;
	 
	 P:=((Y2-Y1)/(X2-X1));
	 D:=Y1 - P*X1;
	 if X1<X2 then
	    
	    for I in (X1+1)..X2 loop
	       Image(I,(P*I + D)):=0; 
	    End loop;
	 else
	    for I in (X2+1)..X1 loop
	       Image(I,(P*I + D)):=0; 
	    End loop;
	 end if;
	   
	 
	 P:=((Y2-Y3)/(X2-X3));
	 D:=Y3 - P*X3;
	 if X3<X2 then
	   for I in (X3+1)..X2 loop 
	   Image(I,(P*I + D)):=0;
	   End loop;
	 else
	    for I in (X2+1)..X3 loop
	   Image(I,(P*I + D)):=0;
	   End loop;
	 end if;
	 
	 
      elsif y2=y3 then
	 for I in X2..X3 loop
	    Image(I,Y2):=0;
	 End loop;
	 
	  P:=((Y1-Y2)/(X1-X2));
	  D:=Y2 - P*X2;
	  if X2<X1 then
	     for I in (X2+1)..X1 loop 
		Image(I,(P*I + D)):=0;
	     End loop;
	  else
	      for I in (X1+1)..X2 loop 
		Image(I,(P*I + D)):=0;
	     End loop;
	  end if;
	  
	 
	  P:=((Y1-Y3)/(X1-X3));
	 D:=Y3 - P*X3;
	 for I in (X3+1)..X1 loop --
	    Image(I,(P*I + D)):=0;
	 End loop;
      end if;
    
   end Dessin_Triangle;
   
      
     
begin
   
   n:=8;
   m:=8;
    for i in 0..n loop
    	for j in 0..m loop
    		image(i,j):=1;
    	end loop;
    end loop;
    
    Put_line("Donner le nom de la figure.");
    Get_Line(nomf, longueur);
    Put( "--" );
    Put( Nomf(1..Longueur) );
    Put( "--" );
    New_Line;
   
    if Nomf(1..Longueur) = "Rectangle" then
        Put_line("Donner le point initial de la figure : ");
        Get(X); Skip_Line;
        Get(Y); Skip_Line;
    	Put_line("Donner la longeur et la largeur");
	get (Longeur) ;
	get (Largeur);
	Dessin_Rectangle (X,Y,longeur, Largeur);
	for i in 0..n loop
	   for j in 0..m loop
    		Put(image(i,j));
	   end loop;
	   Put_Line("");
	end loop;
	
    elsif Nomf(1..Longueur) = "Triangle" then
       
       Put_line ("Donner les coordonnées des 3 sommets  ");
       
       Put_line("coordonnées du point A");
       Get(Ax);Skip_Line;
       Get(Ay);Skip_Line;
       
       Put_line("Coordonnées Du Point B");
       Get(Bx);Skip_Line;
       Get(By);Skip_Line;
       
       Put_line("coordonnées du poit C");
       Get(Cx);Skip_Line;
       Get(Cy);Skip_Line;
       
       Dessin_Triangle(Ax,Ay,Bx,By,Cx,Cy);
       	for i in 0..n loop
	   for j in 0..m loop
    		Put(image(i,j));
	   end loop;
	   Put_Line("");
	end loop;
       
    elsif nomf = "Cercle" then
       put ("Donner le rayon du cercle");
       get (Rayon);
       else Put ("Erreur");
    end if;
end synthese;





