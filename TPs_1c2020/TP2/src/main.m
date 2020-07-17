clear all; close all; 1;

ALPHA = (53*pi)/180;
BETA = (37*pi)/180;

A = [-cos(ALPHA) 0 cos(BETA) 0 0 0;
     -sin(ALPHA) 0 -sin(BETA) 0 0 0;
     cos(ALPHA) 1 0 1 0 0;
     sin(ALPHA) 0 0 0 1 0;
     0 -1 -cos(BETA) 0 0 0 ;
     0 0 sin(BETA) 0 0 1];
