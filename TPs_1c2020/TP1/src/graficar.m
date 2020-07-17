function resultado = graficar(vectorFechas, vectorNivelesHidrometricos, titulo)
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
