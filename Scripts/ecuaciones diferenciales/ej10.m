clear all;
close all;
1;

function res = f(x)
  res = log(x);
endfunction

# La solucion exacta es 4.047189562
disp(simpson(@f,1,5,1));