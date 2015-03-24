WITH Ada.Text_IO;
WITH Ada.Integer_Text_IO ; 
USE Ada.Text_IO;
USE Ada.Integer_Text_IO ;
WITH Ada.Strings.Unbounded.Text_Io;
USE Ada.Strings.Unbounded.Text_Io;

procedure synthese is
	
	
   n,M,X,Y,Ax,Ay,Bx,By,Cx,Cy,longeur,largeur,rayon:Integer;
 
   nomf : String(1..255);
   longueur : Natural;
   
	
   type Forme is (Rectangle, Triangle ,Cercle);
   package Forme_Io is new Enumeration_Io(Forme);
   use Forme_Io;
	
   type Matrice is array(0..10,0..10) of integer;
   image : matrice;
	
   procedure Dessin_Rectangle(x1,y1,longrec,Largrec:in Integer) is 
   begin
      
   	for i in x1..(x1+Longrec) loop
   		for j in y1..y1+largrec loop
   			image(i,j):=0;
   		end loop;
   	end loop;
   end Dessin_Rectangle;
   
      
      
   procedure Dessin_Triangle (X1,Y1,X2,Y2,X3,Y3: in Integer) is
<<<<<<< HEAD
      P,D,P0,D0,P1,D1:Integer ;
=======
      P,D:Integer;
>>>>>>> a53afc22c08f61801eb0e94e79e91722199e971d
	 
   begin
      --Si la base est AB
      --construction de la base
      if y1=y2 then
	 if X1>X2 then	    
	    for I in X2..X1 loop	       
	       Image(I,Y1):=0;	       
	    End loop;
	 else
	     for I in X1..X2 loop
		Image(I,Y1):=0;
	     End loop;
     	 end if;
	 
	 --on cherche l'équation de la droite AC
	 P0:=((Y3-Y1)/(X3-X1));
	 D0:=(Y1 - P0*X1);
	 --Si Ax<Cx on trace une droite AC en incrémentant de A à C
	 if X1<X3 then
	    
	    for I in (X1+1)..X3 loop
	       Image(I,abs(P0*I + D0)):=0;
	    End loop;
	    --si Ax>Cx on trace une droite en incrémentant de C à A
	 else   
	     for I in (X3+1)..X1 loop 
	       Image(I,abs((P0*I + D0))):=0;
	     End loop;
	 end if;
	 
	 -- on cherche l'équation de la droite BC
	 P1:=((Y3-Y2)/(X3-X2));
	 D1:=(Y2 - P1*X2);
	 --Si Bx<Cx on trace une droite BC en incrémentant de B à C
	 if X2<X3 then 
	    for I in (X2+1)..X3 loop 
	       Image(I,abs((P1*I + D1))):=0;
	    End loop;
	     --si Bx>Cx on trace une droite en incrémentant de C à B
	 else
	    for I in (X3+1)..X2 loop 
	       Image(I,abs((P1*I + D1))):=0;
	    End loop;
	 end if;
       end if ; 
       
	 
	   
       if y1=y3 then
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
       end if ; 
       
	 
	 
       if y2=y3 then
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
	     for I in X1+1..X2 loop
		 Image(i,(P*i+D)):=0;
	     End loop;
	  end if;
	  
	 
	  P:=((Y1-Y3)/(X1-X3));
	  D:=Y3 - P*X3;
	  if X1<X3 then
	     for I in (X1+1)..X3 loop
		 Image(I,(P*I + D)):=0;
	     End loop;
	  else
	     for I in (X3+1)..X1 loop --
		Image(I,(P*I + D)):=0;
	     End loop;
	  end if;
       end if; 	  
    
   end Dessin_Triangle;
   
   procedure Dessin_Cercle (X,Y,Rayon: in integer) is 
   begin 
      for I in 0..N loop
	 for J in 0..M loop
	    if (I-X)**2+(J-Y)**2= Rayon**2 then 
	       Image(I,J):=0;
	    end if; 
	 end loop;
      end loop;
      
   end Dessin_Cercle;
         
begin
   
   n:=10;
   m:=10;
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
       
<<<<<<< HEAD
    elsif Nomf(1..Longueur) = "Cercle" then
=======
    elsif nomf = "Cercle" then
       Skip_Line;
>>>>>>> a53afc22c08f61801eb0e94e79e91722199e971d
       Put_Line ("Donner le rayon du cercle");
       Get (Rayon); Skip_Line;
       Put_Line ("Donner le centre du cercle");
       Get (X);Skip_Line;
       Get (Y);Skip_Line;
       Dessin_Cercle (X,Y,Rayon);
       for i in 0..n loop
	   for j in 0..m loop
    		Put(image(i,j));
	   end loop;
	   Put_Line("");
       end loop;       
    else Put ("Erreur");
    end if;
end synthese;


