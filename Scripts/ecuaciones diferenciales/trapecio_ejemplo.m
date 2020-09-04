clear all;
close all;
1;

%Es la funcion f que se quiere integrar
%function res = f(x)
%  res = (pi/2).*(e.^(2-(0.5.*sin(x))));
%endfunction

%function res = f(x)
%  res = 1 ./ (1+ (x.^5));
%endfunction

%limite_inferior = 0;% limite inferior de la integral
%limite_superior = 3; % limite superior de la integral
%h = 0.5; # este es el paso

%trapecio(@f,limite_inferior,limite_superior,0.5)
%simpson(@f,limite_inferior,limite_superior,0.5)
%crear_tabla(@f,limite_inferior,limite_superior,0.5)

function res = g(x)
  
  g = 9.81;
  R = 4;
  r = 0.12;
  
  res = (-1).*(((r.^2).*sqrt(2.*g.*x)))./(((2.*x.*R)-((x).^2)));;
endfunction
f = @(x,t)-(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));
simpson(f,0,1,10)