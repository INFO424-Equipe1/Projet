WITH Ada.Text_IO;
WITH Ada.Integer_Text_IO ; 
USE Ada.Text_IO;
USE Ada.Integer_Text_IO ;
WITH Ada.Strings.Unbounded.Text_Io;
USE Ada.Strings.Unbounded.Text_Io;
with Ada.Command_line;
Use Ada.Command_Line;


procedure synthese is
	
--Variables globales du programme :	
   C,X,Y,Ax,Ay,Bx,By,Cx,Cy,Yx,Zx,longeur,largeur,Rayon,Maxx,Minx,Miny,Maxy,K,R,V,B:Integer; 
   N:Integer;
   M:Integer;

   
--Ce type permet la gestion des différentes formes 	
   type Forme is (Rectangle, Triangle ,Cercle);
   package Forme_Io is new Enumeration_Io(Forme);
   use Forme_Io;
   Nomf:Forme;--Nom de la forme, on peut avoir une variable qui regroupe les 3 formes différentes 
   
   
--Ce type Pixel permet la gestion des couleurs de l'image
   type Pixel is record 
      Rouge : Integer;
      Vert : Integer ; 
      Bleu : Integer ;
   end record ; 
        

--Ce type définit ce qu'est une image : une matrice de taille n,m où chaque case est constituée d'un pixel	
   type Matrice is array ( Integer range <> , Integer range <>) of Pixel;
  
-- Procédure qui dessine un rectangle en fonction du point d'origine, de sa longeur, de sa largeur, de l'image et de sa couleur. 	
   procedure Dessin_Rectangle(x1,y1,longrec,Largrec,R,V,B:in Integer; Image : in out Matrice) is 
   begin
      
   	for i in x1..(x1+Longrec) loop
	   for j in y1..y1+largrec loop
	       image(i,j).Rouge:=R;
	       image(i,j).Vert:=V;
	       image(i,j).Bleu:=B; 
	   end loop;
   	end loop;
   end Dessin_Rectangle;
   
      
      
   procedure Dessin_Triangle (X1,Y1,X2,Y2,X3,Y3,R,V,B: in out Integer; Image : in out Matrice) is
      Tempx,Tempy,Y,A:Integer ;
      Delt,Error,Dx,Dy : Float;
      

	 
   begin
      --Si la base est AB
      --construction de la base
      if Y1=Y3 then
	 Tempx := X3;
	 Tempy := Y3;
	 X3 := X2;
	 Y3 := Y2;
	 X2 := Tempx;
	 Y2 :=Tempy;
      else if 
	Y2=Y3 then
	 Tempx := X3;
	 Tempy := Y3;
	 X3 := X1;
	 Y3 := Y1;
	 X1 := Tempx;
	 Y1 := Tempy;
      end if;
      end if;
          -- En arrivant à cette étape on a donc Y1=Y2
      if X1>=X2 then	
	 Tempx :=X1;
	 X1:=X2;
	 X2:=Tempx;
	 Tempy:=Y1;
	 Y1:=Y2;
	 Y2:=Tempy;
      end if;
      for I in X1..X2 loop  	 
	  image(Y1,I).Rouge:=R;
	  image(Y1,I).Vert:=V;
	  image(Y1,I).Bleu:=B;
      End loop;
      
      
 -- Bresenham's line algorithm     
      if X3<=X1 then 
	 Tempx := X3;
	 Tempy := Y3;
	 X3 := X1;
	 Y3 := Y1;
	 X1 := Tempx;
	 Y1 :=Tempy;
      end if;
      Dx := Float(X3 - X1);
      Dy := Float(Y3 - Y1);
      Error := 0.0;
      Delt := abs(Dy/Dx);
      Y := Y1;
      for I in X1..X3-1 loop
	 image(Y,I).Rouge:=R;
	 image(Y,I).Vert:=V;
	 image(Y,I).Bleu:=B;
	 Error := Error+Delt;
	 while Error >= 0.5 loop
	    if Dy > 0.0 then 
	       Y:=Y+1;
	    else
	       Y:= Y - 1; 
	    end if;
	    Error := Error - 1.0; 
	    image(Y,i).Rouge:=R;
	    image(Y,i).Vert:=V;
	    image(Y,i).Bleu:=B;
	 end loop;
      end loop;
      
      
      if X3<=X2 then 
	 Tempx := X3;
	 Tempy := Y3;
	 X3 := X2;
	 Y3 := Y2;
	 X2 := Tempx;
	 Y2 :=Tempy;
      end if;
      Dx := Float(X3 - X2);
      Dy := Float(Y3 - Y2);
      Error := 0.0;
      Delt := abs(Dy/Dx);
      Y := Y2;
      for I in X2..X3-1 loop
         image(Y,I).Rouge:=R;
	 image(Y,I).Vert:=V;
	 image(Y,I).Bleu:=B;
	 Error := Error+Delt;
	 while Error >= 0.5 loop
	    if Dy > 0.0 then 
	       Y:=Y+1;
	    else
	       Y:= Y-1; 
	    end if;
	    Error := Error-1.0; 
	    image(Y,I).Rouge:=R;
	    image(Y,I).Vert:=V;
	    image(Y,I).Bleu:=B;
	 end loop;
      end loop;
      
  
      
      
------------------------------------- Remplissage du triangle------------------------------------------------------
      
	 
      Minx := Integer'Min(Integer'Min (AX,BX),CX);
      Maxx := Integer'Max(Integer'Max (AX,BX),CX);
      Miny := Integer'Min(Integer'Min (AY,BY),CY);
      Maxy := Integer'Max(Integer'Max (AY,BY),CY);
      for J in Miny-1..Maxy+1 loop	    
	 C:=0;
	 A:=0;
	 for I in Minx..Maxx loop
	    if image(J,I).Rouge/=255 or image(J,I).Vert/=255 or image(J,I).Bleu/=255 then
	       --n'importe quelles couleurs sauf blanc 
	       C:=C+1;
	    end if;   
	    if C=1 and A=0 then	  --A est une variable pour vérifier si on rencontre deux pixels adjacents
	       Yx:=I;	  
	    end if;
	    if C=2 then  
	       Zx:=I;  
	       if Zx=Yx+1 then --Si le test est vrai on recommence à chercher à un autre pixel sinon on remplit le triangle 
		  Yx:=Zx;
		  C:=1;
		  A:=1;
	       else		  
		  for U in Yx..Zx loop
   		     image(J,U).Rouge:=R;		     
		     image(J,U).Vert:=V;		     			
		     image(J,U).Bleu:=B;		     
		  end loop;		  
	       end if;	       
	    end if;
	 end loop;
      end loop;
      
        
   end Dessin_Triangle;
   
   procedure Dessin_Cercle (X,Y,Rayon,R,V,B: in Integer; Image : in out Matrice) is 
   begin 
      for j in 0..m-1 loop
	 for i in 0..n-1 loop
	    if (J-X)**2+(I-Y)**2<= Rayon**2 then 
	       image(j,i).Rouge:=R;
	       image(j,i).Vert:=V;
	       image(j,i).Bleu:=B;
	    end if; 
	 end loop;
      end loop;
      
   end Dessin_Cercle;
         
begin

    
 -- Valeur par défault de l'image : taille 200*300, forme cercle de centre (60,60), de rayon 30 et de couleur Bleu 
  
   M:=200;
   N:=300;
   Nomf:=Cercle;
   X:=60;
   Y:=60;
   Rayon:=30;
   R:=0;
   V:=0;
   B:=255;
   
   K:=1;
   while K <= Argument_Count loop
      if Argument(K) = "--Taille" then 
	 M:= Integer'Value(Argument(K+1));
	 N:= Integer'Value(Argument(K+2));
      elsif Argument(K)="--Cercle" then  
	 Nomf:= Cercle;
	 X:= Integer'Value(Argument(K+1));
	 Y:= Integer'Value(Argument(K+2));
	 Rayon:= Integer'Value(Argument(K+3));
      elsif Argument(K)="--Rectangle" then
	 Nomf := Rectangle;
	 X:= Integer'Value(Argument(K+1));
	 Y:= Integer'Value(Argument(K+2));
	 Longeur:= Integer'Value(Argument(K+3));
	 Largeur:= Integer'Value(Argument(K+4));
      elsif Argument(K)="--Triangle" then
	 Nomf:= Triangle;
	 AX:= Integer'Value(Argument(K+1));
	 AY:= Integer'Value(Argument(K+2));
	 BX:= Integer'Value(Argument(K+3));
	 BY:= Integer'Value(Argument(K+4));
	 CX:= Integer'Value(Argument(K+5));
	 CY:= Integer'Value(Argument(K+6));
      elsif Argument(K)="--Rouge" then
	 R:= 255;
	 V:=0;
	 B:=0;
      elsif Argument(K)="--Vert" then 
	 R:=0;
	 V:=255;
	 B:=0;
      elsif Argument(K)="--Bleu" then 
	 R:=0;
	 V:=0;
	 B:=255;
      elsif Argument(K)="--Jaune" then 
	 R:=255;
	 V:=255;
	 B:=0;
      end if;
      K:=K+1;
   end loop;
	 
   declare 
           
      image : Matrice(0..m,0..n);
   begin
        

      for j in 0..m-1 loop
	 for i in 0..n-1 loop 
	    image(j,i).Rouge:=255;
	    image(j,i).Vert:=255;
	    image(j,i).Bleu:=255;
	 end loop;
      end loop;
      

      if Nomf = Rectangle then
	 
	 Dessin_Rectangle (X,Y,longeur, Largeur,R,V,B,image);
	 
      elsif Nomf = Triangle then
	 
	 Dessin_Triangle(AX,AY,BX,BY,CX,CY,R,V,B,image);  	
	 
	 
      elsif Nomf = Cercle then
	 
	 Dessin_Cercle (X,Y,Rayon,R,V,B,image);
	 
      end if;
      
      Put_Line("P3");
      Put(n);Put(m);
      New_Line;
      Put("255");   
      New_Line;
      

      for i in 0..m-1 loop
	 for j in 0..n-1 loop
	    Put((image(i,j).Rouge));
	    Put((image(i,j).Vert));
	    Put((image(i,j).Bleu));
	 end loop;
	 Put_Line("");
      end loop;
   end;
    

end synthese;
