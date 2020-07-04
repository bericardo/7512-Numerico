clear all;
close all;
1;

x = [0 0 0 0]; #[x1|x2|x3|iteracion]
k = 1; #iteracion

#Tolerancias
t_deseada = 0.02;
t_calculada = 1;

while (t_calculada > t_deseada)
  #Guarda numero de iteracion
  x(k,4) = k-1;
  
  #Ecuaciones
  x(k+1,1) = (28/10) - ( (1/5)*x(k,2) ) - ( (3/5)*x(k,3) );
  x(k+1,2) = 7 - ( (1/10)*x(k+1,1) ) - ( (2/5)*x(k,3) );
  x(k+1,3) = (17/10) + ( (1/5)*x(k+1,1) ) - ( (7/10)*x(k+1,2) );
  
  k += 1;
  #Norma infinita
  if(rows(x) > 1)
    a = abs( x(k,1) - x(k-1,1) );
    b = abs( x(k,2) - x(k-1,2) );
    c = abs( x(k,3) - x(k-1,3) );
    t_calculada = max([a b c]);
  endif
endwhile

#Muestra resultados
printf("Iter: %d\n", k-1);
printf("Iter cortada en: %f\n",t_calculada);
printf("x = %f\n", x(k,1));
printf("y = %f\n", x(k,2));
printf("z = %f\n", x(k,3));