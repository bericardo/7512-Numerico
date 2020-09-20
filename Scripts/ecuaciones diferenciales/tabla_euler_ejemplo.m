%% Ejemplo de uso de la funcion TABLA_EULER
clear all
close all
1;

% Derivada de la funcion f
function res = f_diff(x,u)
  res = (-2.*x) - u;
endfunction

%x = 0;
%u = -1;
%h = 0.05;
%nro_iter = 9;

%tabla = tabla_euler(x,u,h,@f_diff,nro_iter);
%disp(tabla)

# Function M1
function res = g_diff(h)
  % Variables que permanecen constantes
  g = 9.81;
  R = 4;
  r = 0.12;
  
  % Esta seria la formula M1 del problema
  res = (-1).*(((r.^2).*sqrt(2.*g.*h)) ./ (2.*h.*R)-(h.^2));
endfunction

x_inicial = 0;
u_inicial = 6.5;
h = 5;
nro_iteraciones = 10;

tabla = [0 x_inicial u_inicial g_diff(u_inicial)];
for i=2:nro_iteraciones
  x = tabla(i-1,2) + h;
  u = euler(tabla(i-1,2),tabla(i-1,3),h,@f_diff);
  tabla(i,:) = [(i-1) x u f_diff(x,u)];
endfor

disp(tabla);