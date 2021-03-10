clear all;
close all;
1;

function res = F(X)
  res = [(X(1)*X(2)*X(3)-4.188);X(1)+X(2)+X(3)-3.677;X(1)+1.258*X(2)];
endfunction

function res = J(X)
  res = [X(2)*X(3) X(1)*X(3) X(1)*X(2);1 1 1;1 0 0];
endfunction

X = [1;-1;3];
p = 0;
tabla_resultado = [];
for i=1:10
  D = J(X)\ -F(X);
  Xold = X;
  X = Xold + D;
  tabla_resultado(i,:) = [i X' norm(X-Xold) p];
  if rows(tabla_resultado) > 2
    p = (log(tabla_resultado(i,5))-log(tabla_resultado(i-1,5)))/(log(tabla_resultado(i-1,5))-log(tabla_resultado(i-2,5)));
    tabla_resultado(i,6) = p;
  endif  
endfor

disp(tabla_resultado);