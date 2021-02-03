# Grafica las rectas tangentes a la funcion f
# En el grafico se puede observar como las rectas tangente a la funcion f se van
# aproximando a la raiz (como diverge).
function res = graficar_rectas_tangentes(f,f_diff,datos,z)
  # f funcion f(x)
  # f_diff derivada de la funcion f(x)
  # datos matriz devuelta por la funcion newton_raphson_f o newton_raphson_rm
  # z intervalo. Ej.: z = -10:0.1:10
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