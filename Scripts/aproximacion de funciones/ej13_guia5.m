clear all;
close all;
1;
graphics_toolkit('fltk');

function res = graficar_ajuste_lagrange(x,y)
  L0 = (123203./(-12000000)).*(x-1940).*(x-1950).*(x-1960).*(x-1970).*(x-1980);
  L1 = (131669./2400000).*(x-1930).*(x-1950).*(x-1960).*(x-1970).*(x-1980);
  L2 = (150697./(-1200000)).*(x-1930).*(x-1940).*(x-1960).*(x-1970).*(x-1980);
  L3 = (179323./1200000).*(x-1930).*(x-1940).*(x-1950).*(x-1970).*(x-1980);
  L4 = (203212./(-2400000)).*(x-1930).*(x-1940).*(x-1950).*(x-1960).*(x-1980);
  L5 = (226505./12000000).*(x-1930).*(x-1940).*(x-1950).*(x-1960).*(x-1970);
  scatter(x,y);
  hold on;
  plot(x,L0+L1+L2+L3+L4+L5);
endfunction

function res = graficar_ajuste_newton(x,y)
  scatter(x,y);
  hold on;
  plot(x,123203+846.6.*(x-1930)+52.81.*(x-1930).*(x-1940)-(241./1500).*(x-1930).*(x-1940).*(x-1950)-(4457./80000).*(x-1930).*(x-1940).*(x-1950).*(x-1960)+0.002653916667.*(x-1930).*(x-1940).*(x-1950).*(x-1960).*(x-1970));
endfunction

# Utilizando Lagrange
function res = p1(x)
  L0 = (123203./(-12000000)).*(x-1940).*(x-1950).*(x-1960).*(x-1970).*(x-1980);
  L1 = (131669./2400000).*(x-1930).*(x-1950).*(x-1960).*(x-1970).*(x-1980);
  L2 = (150697./(-1200000)).*(x-1930).*(x-1940).*(x-1960).*(x-1970).*(x-1980);
  L3 = (179323./1200000).*(x-1930).*(x-1940).*(x-1950).*(x-1970).*(x-1980);
  L4 = (203212./(-2400000)).*(x-1930).*(x-1940).*(x-1950).*(x-1960).*(x-1980);
  L5 = (226505./12000000).*(x-1930).*(x-1940).*(x-1950).*(x-1960).*(x-1970);
  res = L0+L1+L2+L3+L4+L5;
endfunction

# Utilizando Newton
function res = p2(x)
  res = 123203+846.6.*(x-1930)+52.81.*(x-1930).*(x-1940)-(241./1500).*(x-1930).*(x-1940).*(x-1950)-(4457./80000).*(x-1930).*(x-1940).*(x-1950).*(x-1960)+0.002653916667.*(x-1930).*(x-1940).*(x-1950).*(x-1960).*(x-1970);
endfunction

x = 1930:10:1980;
y = [123203 131669 150697 179323 203212 226505];

disp('Aproximacion con LAGRANGE');
disp(p1(1920));
disp(p1(1965));
disp(p1(2000));

disp('')

disp('Aproximacion con NEWTON')
disp(p2(1920));
disp(p2(1965));
disp(p2(2000));