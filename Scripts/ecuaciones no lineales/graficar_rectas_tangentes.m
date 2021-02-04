function res = graficar_rectas_tangentes(f,f_diff,datos,z)
  rango = rows(datos);
  hold on;
  for i=1:rango
    x = datos(i,2);
    m = f_diff(x);
    b = (-1)*m*x + f(x);
    plot([x x],[f(x) 0]);
    plot(z,m*z + b);
  endfor
  hold off;
endfunction