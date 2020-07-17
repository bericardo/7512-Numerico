function matriz_gram = crear_matriz_gram(Q)  
  A = [];
  for i=1:columns(Q)-1
    for j=1:columns(Q)
      A(i,j)=transpose(Q(:,j))*Q(:,i);
    endfor
  endfor
  matriz_gram=A;
endfunction
