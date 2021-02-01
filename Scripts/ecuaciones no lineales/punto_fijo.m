clear all;
close all;
1;

function x_sig =  g(x_ant)
  x_sig = x_ant - sin(x_ant) + (sqrt(x_ant)/2);
endfunction

resultados = punto_fijo_iter(@g,1,10);

disp(resultados);
