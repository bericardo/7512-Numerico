clear all;
close all;
1;

tabla = [0 0 0 0 0];

for i=2:50
  tabla(i,1)=0.5*(1+tabla(i-1,2));
  tabla(i,2)=0.5*(1+tabla(i,1)+tabla(i-1,3));
  tabla(i,3)=0.5*(1+tabla(i,2)+tabla(i-1,4));
  tabla(i,4)=0.5*(1+tabla(i,3));
  tabla(i,5)=i-1;
endfor

tabla