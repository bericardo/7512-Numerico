clear all;
close all;
1;

function res = f(x)
  res = (pi/2).*(e.^(2-(0.5.*sin(x))));
endfunction

limite_inferior = 0;
limite_superior = 2*pi;
h1 = pi/4;
h2 = pi/2;

disp('TRAPECIO:')
disp(trapecio(@f,limite_inferior,limite_superior,h1));

disp('SIMPSON:')
disp(simpson(@f,limite_inferior,limite_superior,h2));