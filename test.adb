WITH Ada.Text_IO;
WITH Ada.Integer_Text_IO ; 
USE Ada.Text_IO;
USE Ada.Integer_Text_IO ;

procedure synthese is
	
	
	n,m,x,y,Ax,Ay,Bx,By,Cx,Cy,longeur,largeur,rayon:Integer;
	Nomf: String:= " ";
	
	
	
	type Forme is (Rectangle,Triangle,Cercle);
	
	type Matrice is array(0..100,0..100) of integer;
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
       if y1=y2 then
	 for I in X1..X2 loop
	    Image(I,Y1):=0;
	 End loop;
	 
	 P:=((Y3-Y1)/(X3-X1));
	 D:=Y1 - P*X1;
	 for I in (X1+1)..X3 loop --essayer si x1<x3
	    Image(I,(P*I + D)):=0;
	 End loop;
	 
	 P:=((Y3-Y2)/(X3-X2));
	 D:=Y2 - P*X2;
	 for I in (X2+1)..X3 loop 
	    Image(I,(P*I + D)):=0;
	 End loop;
	   
      elsif y1=y3 then
	 for I in X1..X3 loop
	    Image(I,Y1):=0;
	 End loop;  
	 P:=((Y2-Y1)/(X2-X1));
	 D:=Y1 - P*X1;
	 for I in (X1+1)..X2 loop 
	    Image(I,(P*I + D)):=0;
	 End loop;
	 
	 P:=((Y2-Y3)/(X2-X3));
	 D:=Y3 - P*X3;
	 for I in (X3+1)..X2 loop 
	    Image(I,(P*I + D)):=0;
	 End loop;
	 
      elsif y2=y3 then
	 for I in X2..X3 loop
	    Image(I,Y2):=0;
	 End loop;
	 
	  P:=((Y1-Y2)/(X1-X2));
	 D:=Y2 - P*X2;
	 for I in (X2+1)..X1 loop 
	    Image(I,(P*I + D)):=0;
	 End loop;
	 
	  P:=((Y1-Y3)/(X1-X3));
	 D:=Y3 - P*X3;
	 for I in (X3+1)..X1 loop 
	    Image(I,(P*I + D)):=0;
	 End loop;
      end if;
   

      
	    
      
   end Dessin_Triangle;
   
      
      

begin
   Put("y");
   Skip_Line;
   n:=10;
   m:=20;
   Put("x");
    for i in 0..n loop
    	for j in 0..m loop
    		image(i,j):=1;
    	end loop;
    end loop;
    Put_line("Donner le nom de la figure");
    get (nomf);
    Skip_Line;
    Put_line("Donner le point initial de la figure");
    Get( X);get(Y);
	
end synthese;




