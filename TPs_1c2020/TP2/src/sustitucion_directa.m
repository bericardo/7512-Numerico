function vector_soluciones = sustitucion_directa(A_ampliada)
  soluciones = zeros(rows(A_ampliada),1);
  
  for i=1:rows(A_ampliada)
    suma = 0;
    
    for j=1:i-1
      if (j != i)
        suma = suma + A_ampliada(i,j)*soluciones(j);
      endif
    endfor
    
    b = A_ampliada(i,columns(A_ampliada));
    soluciones(i) = (b - suma) / A_ampliada(i,i);
  endfor

  vector_soluciones = soluciones;
endfunction