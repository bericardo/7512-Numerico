function resultado = graficar_fuerza(matriz,titulo,grafico_numero)
  % Graficador
  imagesc([100 190], [1000 1900], matriz);
  colorbar();
  
  % Título
  title(titulo);

  % Rótulos de ejes
  xlabel("Fuerza G(N)",'fontsize',10)
  ylabel("Fuerza F(N)",'fontsize',14)
  
  % Tamaño de letra de los n
  set(gca,'fontsize',20); % sets font of numbers on axes
  
  if (grafico_numero == 12)
    print "punto_d_grafico_fuerza12.jpg";
  elseif (grafico_numero == 23)
    print "punto_d_grafico_fuerza23.jpg";
  elseif (grafico_numero == 13)
    print "punto_d_grafico_fuerza13.jpg";
  endif
endfunction