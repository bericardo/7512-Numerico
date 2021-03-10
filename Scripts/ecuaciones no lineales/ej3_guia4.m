clear all;
close all;
1;

function x_sig =  g(x_ant)
  x_sig = x_ant - sin(x_ant) + (sqrt(x_ant)/2);
endfunction

semilla = 0.6;
error_absoluto = 0.01;

disp(punto_fijo_tol(@g,semilla,error_absoluto));
