%%Se define la matriz A donde las primeras tres filas corresponden a las
%ecuaciones de las fuerzas N12, N23 y N13. Las ecuaciones restantes corresponden
%a las reacciones R
clear all;
close all;
1;

% Convierte los grados 53 y 37 a radianes
ALPHA = (53*pi)/180;
BETA = (37*pi)/180;

A = [-cos(ALPHA) 0 cos(BETA) 0 0 0;
     -sin(ALPHA) 0 -sin(BETA) 0 0 0;
     cos(ALPHA) 1 0 1 0 0;
     sin(ALPHA) 0 0 0 1 0;
     0 -1 -cos(BETA) 0 0 0 ;
     0 0 sin(BETA) 0 0 1];
