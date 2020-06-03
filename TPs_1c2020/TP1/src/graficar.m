% vectorFechas: es un vector con fechas
% vectorNivelesHidrometricos: es un vector con los niveles hidrometricos
% titulo: es el titulo que va a tener el grafico
function resultado = graficar(vectorFechas, vectorNivelesHidrometricos, titulo)
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
  
  print -djpg grafico.jpg
endfunction
