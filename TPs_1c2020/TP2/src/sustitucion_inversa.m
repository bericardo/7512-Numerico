% SUSTITUCION_INVERSA realiza sustitucion inversa y devuelve un vector que 
% contiene el valor de las incognitas.
%
% A - es la matriz ampliada A|b. Debe estar triangulada superiormente, es decir
%     con cero debajo de la diagonal.
function vector_soluciones = sustitucion_inversa(A_ampliada)
  soluciones = zeros(rows(A_ampliada),1);
  
  for i=rows(A_ampliada):-1:1
    suma = 0;

    % Reemplaza las incognitas conocidas y los paso al segundo miembro
    for j=i+1:columns(A_ampliada)-1
      if (j != i)
        suma = suma + A_ampliada(i,j)*soluciones(j);
      endif
    endfor
    
    % Calcula el valor de la incognita y se guarda en el vector soluciones
    b = A_ampliada(i,columns(A_ampliada));
    soluciones(i) = (b - suma) / A_ampliada(i,i);
  endfor
  vector_soluciones = soluciones;
endfunction