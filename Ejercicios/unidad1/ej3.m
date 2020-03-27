close all
clear all

N = 500; # Dimension del vector

function escalarResultado = productoInterno(a,b)
  suma = 0;
  
  for i=1:rows(a)
    suma = suma + a(i,1)*(b(i,1));
  endfor
  
  escalarResultado = suma;
endfunction

function distanciaResultado = distancia(a,b)
  suma = 0;
  
  for i=1:rows(a)
    suma = suma + ((b(i,1)-a(i,1))^2);
  endfor
  
  distanciaResultado = sqrt(suma);
endfunction

# Creo vectores de Nx1 con valores aleatorios
a = rand(N,1);
b = rand(N,1);

b = b.**2; # Eleva todos los elementos del vector b al cuadrado

disp(productoInterno(a,b))
disp(norm(b-a,2))
disp(norm(b-a,inf))
disp(distancia(a,b))

disp('Fin del programa')