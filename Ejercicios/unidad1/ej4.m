clear all
close all

A = rand(100,100);
B = rand(100,100);

# Producto interno entre dos vectores

function resultado = productoInterno(vectorFila,vectorColumna)
  suma = 0;
  
  for i=1:columns(vectorFila)
    suma = suma + vectorFila(i)*vectorColumna(i);
  endfor
  
  resultado = suma;
endfunction

# Multiplica matrices cuadradas

function nuevaMatriz = productoMatrices(A,B)
  matrizAuxiliar = [];
  
  # Hace producto de cada fila de A contra todas las columnas de B
  # Y las guarda en la nueva matriz matrizAuxiliar
  for i=1:rows(A)
    for j=1:columns(A)
      matrizAuxiliar(i,j) = productoInterno(A(i,:),B(:,i));
    endfor
  endfor
  
  nuevaMatriz = matrizAuxiliar;
endfunction

# Traspone matrices cuadradas

function matrizTraspuesta = trasponer(matrizCuadrada)
  auxMatrizTraspuesta = [];
  
  # Toma cada fila y la escribe como columna en la nueva matriz
  for i=1:rows(matrizCuadrada)
    vectorFila = matrizCuadrada(i,:);
    
    for j=1:columns(matrizCuadrada)
      auxMatrizTraspuesta(j,i) = vectorFila(j);
    endfor
    
  endfor
  
  matrizTraspuesta = auxMatrizTraspuesta;
endfunction

# Calcula traza de una matriz cuadrada

function resultado = trazaMatriz(matrizCuadrada)
  suma = 0;
  
  for i=1:rows(matrizCuadrada)
    suma = suma + matrizCuadrada(i,i);
  endfor
  
  resultado = suma;
endfunction

# a)
AB = productoMatrices(A,B);
#disp(AB);

# b)
BA = productoMatrices(B,A);
#disp(BA);

# c)
Atraspuesta = trasponer(A);
Btraspuesta = trasponer(B);

AtraspuestaB = productoMatrices(Atraspuesta,B);
ABtraspuesta = productoMatrices(A,Btraspuesta);

#disp(AtraspuestaB);
#disp(ABtraspuesta);
#disp(trasponer(AB));

# d)
disp(trazaMatriz(AB));
disp(trazaMatriz(BA));
disp(trazaMatriz(AtraspuestaB));
disp(trazaMatriz(ABtraspuesta));
disp(trazaMatriz(trasponer(AB)));