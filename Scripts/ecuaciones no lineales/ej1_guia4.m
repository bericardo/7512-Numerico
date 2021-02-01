close all;
clear all;
1;

function resultado = f(x)
  resultado = ((x.**2)./4) - sin(x);
endfunction

x = -1:0.1:3;

# Se usa el grafico como metodo de arranque para determinar el intervalo [a,b]
#plot(x,@f(x))

disp('TOLERANCIA 0.02');
disp(biseccion_t(@f,1.5,2,0.02,[]));
disp('');
disp('16 ITERACIONES:');
disp(biseccion_c(@f,1.5,2,16,[]));