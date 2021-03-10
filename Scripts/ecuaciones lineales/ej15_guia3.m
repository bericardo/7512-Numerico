clear all;
close all;
1;

tabla = [0 0 0 0 0];

for i=2:
  tabla(i,1)=2-tabla(i-1,4);
  tabla(i,2)=1-((1./4)*tabla(i,1)) + ((1./4)*tabla(i-1,4));
  tabla(i,3)=2-tabla(i,1);
  tabla(i,4)=2-tabla(i,3);
  tabla(i,5)=i-1;
endfor

tabla