% Crea tabla de datos que se usa con el metodo del trapecio y simpson
% f es la funcion que se quiere integrar
% lim_inf es el limite de integracion inferior
% lim_sup es el limite de integracion superior
function tabla_resultado = crear_tabla(f,lim_inf,lim_sup,h)
  y = f(lim_inf);
  x_sig = lim_inf + h;
  tabla = [lim_inf; y];
  columna = 2;
  while (x_sig <= lim_sup)
    tabla(1,columna) = x_sig;
    tabla(2,columna) = f(x_sig);
    x_sig += h;
    columna += 1;
  endwhile
  tabla_resultado = tabla;
endfunction