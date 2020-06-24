clear all;
close all;
1;

#Semilla. [x | y | z | Nro. de iteracion]
x = [0 0 0 0]; 
k = 1; #iteracion

#Tolerancia
t_deseada = 0.02;
t_calculada = 1;

while (t_calculada > t_deseada)
  x(k,4) = k-1;
  
  #Ecuaciones
  x(k+1,1) = (28/10) - ( (1/5)*x(k,2) ) - ( (3/5)*x(k,3) );
  x(k+1,2) = 7 - ( (1/10)*x(k+1,1) ) - ( (2/5)*x(k,3) );
  x(k+1,3) = (17/10) + ( (1/5)*x(k+1,1) ) - ( (7/10)*x(k+1,2) );
  k += 1;
  
  #Calculo de tolerancia
  if(rows(x) > 1)
    a = abs( x(k,1) - x(k-1,1) );
    b = abs( x(k,2) - x(k-1,2) );
    c = abs( x(k,3) - x(k-1,3) );
    t_calculada = max([a b c]);
  endif
endwhile

#Muestra resultados
printf("Iteracion: %d\n", k-1);
printf("La iteracion se corto al llegar a la tolerancia: %f\n",t_calculada);
printf("x = %f\n", x(k,1));
printf("y = %f\n", x(k,2));
printf("z = %f\n", x(k,3));