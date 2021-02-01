function tabla_resultado = tabla_euler(x_inicial,u_inicial,h,f_diff,nro_iteraciones)
  tabla = [0 x_inicial u_inicial f_diff(x_inicial,u_inicial)];
  for i=2:nro_iteraciones
    x = tabla(i-1,2) + h;
    u = euler(tabla(i-1,2),tabla(i-1,3),h,@f_diff);
    tabla(i,:) = [(i-1) x u f_diff(x,u)];
  endfor
  tabla_resultado = tabla;
endfunction