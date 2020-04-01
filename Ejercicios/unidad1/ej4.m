clear all
close all

A = rand(100,100);
B = rand(100,100);


%----------------------------FUNCIONES-----------------------------%

# Producto interno entre dos vectores.
# Utilizada solo por funcion productoMatrices.
function resultado = productoInterno(vectorFila,vectorColumna)
  suma = 0;
  
  for i=1:columns(vectorFila)
    suma = suma + vectorFila(i)*vectorColumna(i);
  endfor
  
  resultado = suma;
endfunction

# Multiplica matrices cuadradas
function matrizResultante = productoMatrices(A,B)
  matrizAuxiliar = [];
  
  # Hace producto de cada fila de A contra todas las columnas de B
  for i=1:rows(A)
    for j=1:columns(A)
      matrizAuxiliar(i,j) = productoInterno(A(i,:),B(:,i));
    endfor
  endfor
  
  matrizResultante = matrizAuxiliar;
endfunction

# Traspone matrices cuadradas
function matrizResultante = trasponer(matrizCuadrada)
  matrizTraspuesta = [];
  
  # Toma cada fila y la escribe como columna en la nueva matriz
  for i=1:rows(matrizCuadrada)
    vectorFila = matrizCuadrada(i,:);
    
    for j=1:columns(matrizCuadrada)
      matrizTraspuesta(j,i) = vectorFila(j);
    endfor
  endfor
  
  matrizResultante = matrizTraspuesta;
endfunction

# Calcula traza de una matriz cuadrada
function resultado = trazaMatriz(matrizCuadrada)
  suma = 0;
  
  for i=1:rows(matrizCuadrada)
    suma = suma + matrizCuadrada(i,i);
  endfor
  
  resultado = suma;
endfunction

# Devuelve una matriz con los coeficientes maximo y minimo junto con sus
# respectivas posiciones en la matriz.
#
# La primera columna de la matriz contiene los coeficientes max y min.
# La segunda columna de la matriz contiene las posiciones i del valor max y min.
# La tercera columna de la matriz contiene las posiciones j del valor max y min.
function vectorResultante = coeficientes(A)
  maxMinVector = [];
  
  valorMaximo = A(1,1);
  posicioniMaximo = 0;
  posicionjMaximo = 0;
  
  valorMinimo = A(1,1);
  posicioniMinimo = 1;
  posicionjMinimo = 1;
  
  for i=1:rows(A)
    for j=1:rows(A)
      
      if (A(i,j) > valorMaximo)
        valorMaximo = A(i,j);
        posicioniMaximo = i;
        posicionjMaximo = j;
      endif
        
      if (A(i,j) < valorMinimo)
        valorMinimo = A(i,j);
        posicioniMinimo = i;
        posicionjMinimo = j;
      endif
        
    endfor
  endfor
  
  maxMinVector(1,1) = valorMaximo;
  maxMinVector(1,2) = posicioniMaximo;
  maxMinVector(1,3) = posicionjMaximo;
  
  maxMinVector(2,1) = valorMinimo;
  maxMinVector(2,2) = posicioniMinimo;
  maxMinVector(2,3) = posicionjMinimo;
  
  vectorResultante = maxMinVector;
endfunction

%------------------------------RESPUESTAS------------------------------%

# a)
AB = productoMatrices(A,B);
disp(AB);

# b)
BA = productoMatrices(B,A);
disp(BA);

# c)
Atraspuesta = trasponer(A);
Btraspuesta = trasponer(B);

AtraspuestaB = productoMatrices(Atraspuesta,B);
ABtraspuesta = productoMatrices(A,Btraspuesta);

disp(AtraspuestaB);
disp(ABtraspuesta);
disp(trasponer(AB));

# d)
disp('Traza de los resultados anteriores:');
disp('----')

disp('Traza de AB:');
disp(trazaMatriz(AB));

disp('Traza de BA:');
disp(trazaMatriz(BA));

disp('Traza de (A^t)B:');
disp(trazaMatriz(AtraspuestaB));

disp('Traza de A(B^t):');
disp(trazaMatriz(ABtraspuesta));

disp('Traza de (AB)^t:');
disp(trazaMatriz(trasponer(AB)));

# e y f)
disp('Coeficientes Maximos y Minimos de resultados anteriores junto a sus posiciones:');
disp('El formato es el siguiente: coeficiente | posicion i | posicion j');
disp('----')

disp('Coeficientes de AB:');
mCoeficientes = coeficientes(AB);
disp(mCoeficientes);

disp('Coeficientes de BA:');
mCoeficientes = coeficientes(BA);
disp(mCoeficientes);

disp('Coeficientes de (A^t)B:');
mCoeficientes = coeficientes(AtraspuestaB);
disp(mCoeficientes);

disp('Coeficientes de A(B^t):');
mCoeficientes = coeficientes(ABtraspuesta);
disp(mCoeficientes);

disp('Coeficientes de (AB)^t:');
mCoeficientes = coeficientes(trasponer(AB));
disp(mCoeficientes);

disp('Fin del programa');