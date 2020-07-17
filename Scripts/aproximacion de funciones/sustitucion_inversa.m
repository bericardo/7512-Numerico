function vector_soluciones = sustitucion_inversa(A_ampliada)
  soluciones = zeros(rows(A_ampliada),1);
  
  for i=rows(A_ampliada):-1:1
    suma = 0;
    for j=i+1:columns(A_ampliada)-1
      if (j != i)
        suma = suma + A_ampliada(i,j)*soluciones(j);
      endif
    endfor
    b = A_ampliada(i,columns(A_ampliada));
    soluciones(i) = (b - suma) / A_ampliada(i,i);
  endfor
  
  vector_soluciones = soluciones;
endfunction