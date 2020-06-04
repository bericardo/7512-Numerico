% SUSTITUCION_DIRECTA realiza sustitucion directa y devuelve un vector que 
% contiene el valor de las incognitas
%
% A_ampliada - es la matriz A|b. A debe estar triangulada inferiormente, esto es
%              con cero por encima de la diagonal.
function vector_soluciones = sustitucion_directa(A_ampliada)
  soluciones = zeros(rows(A_ampliada),1);
  
  for i=1:rows(A_ampliada)
    suma = 0;
    
    % Reemplaza las incognitas conocidas y los paso al segundo miembro
    for j=1:i-1
      if (j != i)
        suma = suma + A_ampliada(i,j)*soluciones(j);
      endif
    endfor
    
    % Calcula el valor de la incognita y la guarda en el vector soluciones
    b = A_ampliada(i,columns(A_ampliada));
    soluciones(i) = (b - suma) / A_ampliada(i,i);
  endfor

  vector_soluciones = soluciones;
endfunction