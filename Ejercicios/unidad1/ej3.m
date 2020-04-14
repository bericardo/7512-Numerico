close all
clear all

N = 500; % Dimension del vector

function resultado = crearVector(exponente,dimension)
  nuevoVector = [];
  
  for i=1:dimension
    nuevoVector(i) = i.**exponente;
  endfor
  
  resultado = nuevoVector;
endfunction

function resultado = productoInterno(a,b)
  suma = 0;
  
  for i=1:rows(a)
    suma = suma + a(i,1)*(b(i,1));
  endfor
  
  resultado = suma;
endfunction

function resultado = distancia(a,b)
  suma = 0;
  
  for i=1:rows(a)
    suma = suma + ((b(i,1)-a(i,1))^2);
  endfor
  
  resultado = sqrt(suma);
endfunction

% Creo vectores de Nx1 con valores aleatorios
a = crearVector(1,N);
b = crearVector(2,N);

disp('Producto Interno:');
disp(productoInterno(a,b));

disp('Norma cuadrado:');
disp(norm(b-a,2))

disp('Norma infinito:');
disp(norm(b-a,inf))

disp('Distancia entre vectores:');
disp(distancia(a,b))

disp('Fin del programa');