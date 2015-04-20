WITH Ada.Text_IO;
WITH Ada.Integer_Text_IO ; 
USE Ada.Text_IO;
USE Ada.Integer_Text_IO ;
WITH Ada.Strings.Unbounded.Text_Io;
USE Ada.Strings.Unbounded.Text_Io;
with Ada.Command_line;
Use Ada.Command_Line;


procedure synthese is
	
	
   C,n,m,X,Y,Ax,Ay,Bx,By,Cx,Cy,Yx,Zx,longeur,largeur,Rayon,Maxx,Minx,Miny,Maxy,K,R,V,B:Integer;   
 
   NomT: String(1..8);
   NomC: String(1..6);
   NomR: String(1..9);
      
	
   type Forme is (Rectangle, Triangle ,Cercle);
   package Forme_Io is new Enumeration_Io(Forme);
   use Forme_Io;
   
   type Pixel is record 
      Rouge : Integer;
      Vert : Integer ; 
      Bleu : Integer ;
   end record ; 
        

	
   type Matrice is array(0..100,0..100) of Pixel;
   image : Matrice;
	
   procedure Dessin_Rectangle(x1,y1,longrec,Largrec,R,V,B:in Integer) is 
   begin
      
   	for i in x1..(x1+Longrec) loop
	   for j in y1..y1+largrec loop
	       image(i,j).Rouge:=R;
	       image(i,j).Vert:=V;
	       image(i,j).Bleu:=B; 
	   end loop;
   	end loop;
   end Dessin_Rectangle;
   
      
      
   procedure Dessin_Triangle (X1,Y1,X2,Y2,X3,Y3,R,V,B: in out Integer) is
      Tempx,Tempy,Y:Integer ;
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
      for I in X1..X2-1 loop  	 
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
	 for I in Minx..Maxx loop
	    if image(J,I).Rouge/=255 and image(J,I).Vert/=255 and image(J,I).Bleu/=255 then
	       --n'importe quelles couleurs sauf blanc 
	       C:=C+1;  
	    end if;   
	    if C=1 then	  
	       Yx:=I;	  
	    end if;
	    if C=2 then  
	       Zx:=I;  
	       for U in Yx..Zx loop
		  image(J,U).Rouge:=R;
		  image(J,U).Vert:=V;
		  image(J,U).Bleu:=B;   
	       end loop;   
	    end if;   
	 end loop; 	    
      end loop;
      
        
   end Dessin_Triangle;
   
   procedure Dessin_Cercle (X,Y,Rayon,R,V,B: in integer) is 
   begin 
      for I in 0..N-1 loop
	 for J in 0..M-1 loop
	    if (I-X)**2+(J-Y)**2<= Rayon**2 then 
	       image(J,I).Rouge:=R;
	       image(J,I).Vert:=V;
	       image(J,I).Bleu:=B;
	    end if; 
	 end loop;
      end loop;
      
   end Dessin_Cercle;
         
begin
   
   R:=0;
   V:=0;
   B:=0;
 
  -- Put( "Les arguments sont : ") ;
  -- for Arg in 1..Argument_Count loop
  --    Put(Argument(Arg) & ", ");
 --  end loop;
 --  New_Line;
    
 -- Valeur par défault de l'image : taille 200*300, forme cercle de centre (60,60), de rayon 30 et de couleur Bleu 
   K:=1;
   if Argument_Count = 0 then 
      N:=300;
      M:=200;
      NomC:="Cercle";
      X:=60;
      Y:=60;
      Rayon:=30;
      R:=0;
      V:=0;
      B:=255;
   end if;
   
   while K< Argument_Count loop
      if Argument(K) = "--taille" then 
	 N:= Integer'Value(Argument(K+1));
	 M:= Integer'Value(Argument(K+2));
      elsif Argument(K)="--Cercle" then 
	 NomC:= "Cercle";
	 X:= Integer'Value(Argument(K+1));
	 Y:= Integer'Value(Argument(K+2));
	 Rayon:= Integer'Value(Argument(K+3));
      elsif Argument(K)="--Rectangle" then
	 NomR := "Rectangle";
	 X:= Integer'Value(Argument(K+1));
	 Y:= Integer'Value(Argument(K+2));
	 Longeur:= Integer'Value(Argument(K+3));
	 Largeur:= Integer'Value(Argument(K+4));
      elsif Argument(K)="--Triangle" then
	 NomT:= "Triangle";
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
  
     
   for i in 0..N-1 loop
      for j in 0..M-1 loop
	 image(I,j).Rouge:=255;
	 image(I,j).Vert:=255;
	 image(I,j).Bleu:=255;
      end loop;
   end loop;
    
   -- Put_line("Donner le nom de la figure.");
  --  Get_Line(nomf, longueur);
  --  Put( "--" );
   -- Put( Nomf(1..Longueur) );
   -- Put( "--" );
   -- New_Line;
 

   if NomR = "Rectangle" then
      
        --Put_line("Donner le point initial de la figure : ");
       -- Get(X); Skip_Line;
        --Get(Y); Skip_Line;
    --	Put_line("Donner la longeur et la largeur");
	--get (Longeur) ;
	--get (Largeur);
      Dessin_Rectangle (X,Y,longeur, Largeur,R,V,B);
      
	
	
   elsif NomT = "Triangle" then
            
     --  Put_line ("Donner les coordonnées des 3 sommets  "); 
       --Put_line("coordonnées du point A");
      -- Get(Ax);Skip_Line;
      -- Get(Ay);Skip_Line;
       
      -- Put_line("Coordonnées Du Point B");
       --Get(Bx);Skip_Line;
      -- Get(By);Skip_Line;
       
      -- Put_line("coordonnées du poit C");
      -- Get(Cx);Skip_Line;
      -- Get(Cy);Skip_Line;
       
      Dessin_Triangle(AX,AY,BX,BY,CX,CY,R,V,B);  	
    
       
   elsif NomC = "Cercle" then

    --   Put_Line ("Donner le rayon du cercle");
    --   Get (Rayon); Skip_Line;
    --   Put_Line ("Donner le centre du cercle");
    --   Get (X);Skip_Line;
    --   Get (Y);Skip_Line;
      
      Dessin_Cercle (X,Y,Rayon,R,V,B);
           
   end if;
     
   Put_Line("P3");
   Put(n);Put(m);
   New_Line;
   Put("255");   
   New_Line;
   
  -- Put(R);Put(V);Put(B);
   --New_Line;

   for i in 0..n-1 loop
      for j in 0..m-1 loop
	 Put((image(i,j).Rouge));
	 Put((image(i,j).Vert));
	 Put((image(i,j).Bleu));
      end loop;
      Put_Line("");
   end loop;
   
    
    
    
    
end synthese;
