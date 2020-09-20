clear all;
close all;
1;

function res = f(x)
  res = sin(x);
endfunction

limInf = 0;
limSup = pi/2;
h = pi/12;

disp('TRAPECIO:');
disp(trapecio(@f,limInf,limSup,h));

disp('SIMPSON');
disp(simpson(@f,limInf,limSup,h));