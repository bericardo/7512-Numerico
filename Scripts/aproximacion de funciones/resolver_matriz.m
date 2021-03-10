function vector_solucion = resolver_matriz(Q)  
  A = [];
  for i=1:columns(Q)-1
    for j=1:columns(Q)
      A(i,j)=transpose(Q(:,j))*Q(:,i);
    endfor
  endfor
  vector_solucion = A(:,1:columns(A)-1)\A(:,columns(A));
endfunction
