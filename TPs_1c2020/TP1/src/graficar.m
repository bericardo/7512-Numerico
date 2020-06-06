function resultado = graficar(vectorFechas, vectorNivelesHidrometricos, titulo)
%%GRAFICAR hace un grafico nivel hidrometrico-fecha
%  vectorFechas - es un vector de Nx1 con fechas
%  vectorNivelesHidrometricos- es un vector de Nx1 con los niveles hidrometricos
%  titulo - es el titulo que va a tener el grafico
  
  % Lista de elementos a graficar
  legend_list = {"Nivel Hidrometrico"};
  
  % Graficador
  plot(vectorFechas, vectorNivelesHidrometricos, '-');
  
  datetick(gca);

  legend(legend_list);
  
  % Título
  title(titulo);

  % Rótulos de ejes
  xlabel("Fecha",'fontsize',10)
  ylabel("Nivel Hidrometrico",'fontsize',14)
  
  % Grilla
  grid

  % Tamaño de letra de los n
  set(gca,'fontsize',20); % sets font of numbers on axes
  
  % Exporta el grafico como archivo jpg
  print -djpg grafico.jpg
endfunction
