% Crea tabla de datos que se usa con el metodo del trapecio y simpson
% f es la funcion que se quiere integrar
% lim_inf es el limite de integracion inferior
% lim_sup es el limite de integracion superior
function tabla_resultado = crear_tabla(f,lim_inf,lim_sup,h)
  tabla = [lim_inf; f(lim_inf)];
  x_sig = lim_inf + h;
  columna = 2;
  while (x_sig < lim_sup)
    tabla(:,columna) = [x_sig;f(x_sig)];
    x_sig += h;
    columna += 1;
  endwhile
  tabla(:,columna) = [lim_sup;f(lim_sup)];
  tabla_resultado = tabla;
endfunction