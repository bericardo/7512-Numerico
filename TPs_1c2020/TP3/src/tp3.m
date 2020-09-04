output_precision(10)

g = 9.81;
R = 4;
r = 0.12;

f = @(t,x) -(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h = 10;
T = 600;
N = ceil((T - t0)/h);

% Metodo de Euler con un paso de 10 segundos
function [tt, yy] = euler(f,t0,y0,h,N)
 k = N+1;
 tt = zeros(k,1);
 yy = zeros(k,1);
 tt(1) = t0;
 yy(1) = y0;
 for i = 2:k
 tt(i) = tt(i-1) + h;
 m = f(tt(i-1),yy(i-1));
 yy(i) = yy(i-1) + h*m;
 end
end

[tt ye] = euler(f,t0,y0,h,N);
'Euler con paso de 10 segundos'
[tt ye];

%Cambio el paso a 5 segundos

g = 9.81;
R = 4;
r = 0.12;

f = @(t,x) -(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h1 = 5;
T = 600;
N = ceil((T - t0)/h1);


[tt1 ye1] = euler(f,t0,y0,h1,N);
'Euler con paso de 5 segundos'
[tt1 ye1];

%Cambio el paso a 1 segundo

g = 9.81;
R = 4;
r = 0.12;

f = @(t,x) -(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h2 = 1;
T = 600;
N = ceil((T - t0)/h2);

[tt2 ye2] = euler(f,t0,y0,h2,N);
'Euler con paso de 1 segundos'
[tt2 ye2];


%Ahora voy a usar el m�todo de Runga Kutta 2 con un paso de tiempo 10 segundos

g = 9.81;
R = 4;
r = 0.12;

f = @(t,x) -(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h3 = 10;
T = 600;
N = ceil((T - t0)/h3);

function [tt3, yy3] = rk2(f,t0,y0,h3,N)
 k = N+1;
 tt3 = zeros(k,1);
 yy3 = zeros(k,1);
 tt3(1) = t0;
 yy3(1) = y0;
 for i = 2:k
 tt3(i) = tt3(i-1) + h3;
 m1 = f(tt3(i-1),yy3(i-1));
 m2 = f(tt3(i),yy3(i-1) + h3*m1);
 yy3(i) = yy3(i-1) + h3*(m1 + m2)/2;
 end
end

[tt3 yy3] = rk2(f,t0,y0,h3,N);
'Runge Kuta 2 con paso de 10 segundos'
[tt3 yy3];

%Ahora voy a usar el m�todo de Runga Kutta 2 con un paso de tiempo 5 segundos

g = 9.81;
R = 4;
r = 0.12;

f = @(t,x) -(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h4 = 5;
T = 600;
N = ceil((T - t0)/h4);

[tt4 yy4] = rk2(f,t0,y0,h4,N);
'Runge Kuta 2 con paso de 5 segundos'
[tt4 yy4];

%Ahora voy a usar el m�todo de Runga Kutta 2 con un paso de tiempo 1 segundos

g = 9.81;
R = 4;
r = 0.12;

f = @(t,x) -(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h5 = 1;
T = 600;
N = ceil((T - t0)/h5);

[tt5 yy5] = rk2(f,t0,y0,h5,N);
'Runge Kuta 2 con paso de 1 segundos'
[tt5 yy5];

%Usando el m�todo de Runge-Kutta4
%Paso de 10 segundos

g = 9.81;
R = 4;
r = 0.12;

f = @(t,x) -(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h6 = 10;
T = 600;
N = ceil((T - t0)/h6);


function [tt6, yy6] = rk4(f,t0,y0,h6,N)
 k = N+1;
 tt6 = zeros(k,1);
 yy6 = zeros(k,1);
 tt6(1) = t0;
 yy6(1) = y0;
 for i = 2:k
 tt6(i) = tt6(i-1) + h6;
 m1 = f(tt6(i-1),yy6(i-1));
 m2 = f(tt6(i-1) + (h6/2),yy6(i-1) + (h6/2)*m1);
 m3 = f(tt6(i-1) + (h6/2),yy6(i-1) + (h6/2)*m2);
 m4 = f(tt6(i),yy6(i-1) + h6*m3);
 yy6(i) = yy6(i-1) + h6*(m1 + 2*m2 + 2*m3 + m4)/6;
 end
end

[tt6 yy6] = rk4(f,t0,y0,h6,N);
'Runge Kuta 4 con paso de 10 segundos'
[tt6 yy6];

%Paso de 5 segundos

g = 9.81;
R = 4;
r = 0.12;

f = @(t,x) -(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h7 = 5;
T = 600;
N = ceil((T - t0)/h7);

[tt7 yy7] = rk4(f,t0,y0,h7,N);
'Runge Kuta 4 con paso de 5 segundos'
[tt7 yy7];

%Paso de 1 segundos

g = 9.81;
R = 4;
r = 0.12;

f = @(t,x) -(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h8 = 1;
T = 600;
N = ceil((T - t0)/h8);


[tt8 yy8] = rk4(f,t0,y0,h8,N);
'Runge Kuta 4 con paso de 1 segundos'
[tt8 yy8];

%Voy a realizar un an�lisis de sensibilidad. Para este caso voy a usar el modelo M2 que agrega un coeficiente CC

%Paso de 10 segundos Cc=0.55

g = 9.81;
R = 4;
r = 0.12;
c = 0.55;

f1 = @(t,x) -(((r^2)*(c*sqrt(2*g*x)))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h9 = 10;
T = 600;
N = ceil((T - t0)/h9);


function [tt9, yy9] = rk4cc1(f1,t0,y0,h9,N)
 k = N+1;
 tt9 = zeros(k,1);
 yy9 = zeros(k,1);
 tt9(1) = t0;
 yy9(1) = y0;
 for i = 2:k
 tt9(i) = tt9(i-1) + h9;
 m1 = f1(tt9(i-1),yy9(i-1));
 m2 = f1(tt9(i-1) + (h9/2),yy9(i-1) + (h9/2)*m1);
 m3 = f1(tt9(i-1) + (h9/2),yy9(i-1) + (h9/2)*m2);
 m4 = f1(tt9(i),yy9(i-1) + h9*m3);
 yy9(i) = yy9(i-1) + h9*(m1 + 2*m2 + 2*m3 + m4)/6;
 end
end

[tt9 yy9] = rk4cc1(f1,t0,y0,h9,N);
'Runge Kuta 4 con paso de 10 segundos cc 0.55' 
[tt9 yy9];

%Paso de 5 segundos Cc=0.55

g = 9.81;
R = 4;
r = 0.12;
c = 0.55;

f1 = @(t,x) -(((r^2)*(c*sqrt(2*g*x)))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h10 = 5;
T = 600;
N = ceil((T - t0)/h10);


[tt10, yy10] = rk4cc1(f1,t0,y0,h10,N);
[tt10, yy10];

%Paso de 1 segundos Cc=0.55

g = 9.81;
R = 4;
r = 0.12;
c = 0.55;

f1 = @(t,x) -(((r^2)*(c*sqrt(2*g*x)))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h11 = 1;
T = 600;
N = ceil((T - t0)/h11);


[tt11, yy11] = rk4cc1(f1,t0,y0,h11,N);
[tt11, yy11];

%Paso de 10 segundos Cc=0.65

g = 9.81;
R = 4;
r = 0.12;
c = 0.65;

f1 = @(t,x) -(((r^2)*(c*sqrt(2*g*x)))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h12 = 10;
T = 600;
N = ceil((T - t0)/h12);


[tt12, yy12] = rk4cc1(f1,t0,y0,h12,N);
[tt12, yy12];

%Paso de 5 segundos Cc=0.65

g = 9.81;
R = 4;
r = 0.12;
c = 0.65;

f1 = @(t,x) -(((r^2)*(c*sqrt(2*g*x)))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h13 = 5;
T = 600;
N = ceil((T - t0)/h13);

[tt13, yy13] = rk4cc1(f1,t0,y0,h13,N);
[tt13, yy13];

%Paso de 1 segundos Cc=0.65

g = 9.81;
R = 4;
r = 0.12;
c = 0.65;

f1 = @(t,x) -(((r^2)*(c*sqrt(2*g*x)))/((2*x*R)-((x)^2)));
t0 = 0;
y0 = 6.5;

h14 = 1;
T = 600;
N = ceil((T - t0)/h14);

[tt14, yy14] = rk4cc1(f1,t0,y0,h14,N);
[tt14, yy14];

%Metodo del trapecio para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 10 segundos [tt6 yy6]
'Runge Kuta 4 con paso de 10 segundos cc 1 primer minuto' 

puntoa = tt6(1)
puntob = tt6(7)
fa = yy6(1)
fb= yy6(7)

puntomedio = 10/2
suma =0;

for i =2:6
  suma = yy6(i) + suma;
  suma = suma;
endfor
suma;

integralRK10min1 = puntomedio*(fa + fb + 2*suma);
integralRK10min1

%Metodo del trapecio para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 10 segundos [tt6 yy6]
'Runge Kuta 4 con paso de 10 segundos cc 1 minuto 9 a 10' 

puntoa = tt6(55)
puntob = tt6(61)
fa = yy6(55)
fb= yy6(61)

puntomedio = 10/2
suma =0;

for i =52:60
  suma = yy6(i) + suma;
  suma = suma;
endfor
suma;

integralRK10min9 = puntomedio*(fa + fb + 2*suma);
integralRK10min9

%Metodo del trapecio para RK4 con cc=0.65 primer minuto
%Vector soluci�n de con paso de 10 segundos [tt9 yy9]
'Runge Kuta 4 con paso de 10 segundos cc 0.55 primer minuto' 

puntoa = tt9(1)
puntob = tt9(7)
fa = yy9(1)
fb= yy9(7)

puntomedio = 10/2
suma =0;

for i =2:6
  suma = yy9(i) + suma;
  suma = suma;
endfor
suma;

integralRK10cc055min1 = puntomedio*(fa + fb + 2*suma);
integralRK10cc055min1

%Metodo del trapecio para RK4 con cc=0.65 primer minuto
%Vector soluci�n de con paso de 10 segundos [tt9 yy9]
'Runge Kuta 4 con paso de 10 segundos cc 0.55 minuto 9 a 10' 

puntoa = tt9(55)
puntob = tt9(61)
fa = yy9(55)
fb= yy9(61)

puntomedio = 10/2
suma =0;

for i =56:60
  suma = yy9(i) + suma;
  suma = suma;
endfor
suma;

integralRK10cc055min9 = puntomedio*(fa + fb + 2*suma);
integralRK10cc055min9

%Metodo del trapecio para RK4 con cc=0.65 primer minuto
%Vector soluci�n de con paso de 10 segundos [tt12 yy12]
'Runge Kuta 4 con paso de 10 segundos cc 0.65 primer minuto' 

puntoa = tt12(1)
puntob = tt12(7)
fa = yy12(1)
fb= yy12(7)

puntomedio = 10/2
suma =0;

for i =2:6
  suma = yy12(i) + suma;
  suma = suma;
endfor
suma;

integralRK10cc065min1 = puntomedio*(fa + fb + 2*suma);
integralRK10cc065min1

%Metodo del trapecio para RK4 con cc=0.65 minuto 9 a 10
%Vector soluci�n de con paso de 10 segundos [tt12 yy12]
'Runge Kuta 4 con paso de 10 segundos cc 0.65 minuto 9 a 10' 

puntoa = tt12(55)
puntob = tt12(61)
fa = yy12(55)
fb= yy12(61)

puntomedio = 10/2
suma =0;

for i =56:60
  suma = yy12(i) + suma;
  suma = suma;
endfor
suma;

integralRK10cc065min9 = puntomedio*(fa + fb + 2*suma);
integralRK10cc065min9

%Metodo del trapecio para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 5 segundos [tt7 yy7]
'Runge Kuta 4 con paso de 5 segundos cc1 primer minuto' 

puntoa = tt7(1)
puntob = tt7(13)
fa = yy7(1)
fb= yy7(13)

puntomedio = 5/2
suma =0;

for i =2:12
  suma = yy7(i) + suma;
  suma = suma;
endfor
suma;

integralRK5cc1min1 = puntomedio*(fa + fb + 2*suma);
integralRK5cc1min1

%Metodo del trapecio para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 5 segundos [tt7 yy7]
'Runge Kuta 4 con paso de 5 segundos cc1 minuto 9 a 10' 

puntoa = tt7(109)
puntob = tt7(121)
fa = yy7(109)
fb= yy7(121)

puntomedio = 5/2
suma =0;

for i =110:120
  suma = yy7(i) + suma;
  suma = suma;
endfor
suma;

integralRK5cc1min9 = puntomedio*(fa + fb + 2*suma);
integralRK5cc1min9

%Metodo del trapecio para RK4 con cc=0.55 primer minuto
%Vector soluci�n de con paso de 5 segundos [tt10 yy10]
'Runge Kuta 4 con paso de 5 segundos cc 0.55 primer minuto' 

puntoa = tt10(1)
puntob = tt10(13)
fa = yy10(1)
fb= yy10(13)

puntomedio = 5/2
suma =0;

for i =2:12
  suma = yy10(i) + suma;
  suma = suma;
endfor
suma;

integralRK5cc55 = puntomedio*(fa + fb + 2*suma);
integralRK5cc55

%Metodo del trapecio para RK4 con cc=0.55 minuto 9 a 10
%Vector soluci�n de con paso de 5 segundos [tt10 yy10]
'Runge Kuta 4 con paso de 5 segundos cc 0.55 minuto 9 a 10' 

puntoa = tt10(109)
puntob = tt10(121)
fa = yy10(109)
fb= yy10(121)

puntomedio = 5/2
suma =0;

for i =110:120
  suma = yy10(i) + suma;
  suma = suma;
endfor
suma;

integralRK5cc55min9 = puntomedio*(fa + fb + 2*suma);
integralRK5cc55min9

%Metodo del trapecio para RK4 con cc=0.65 primer minuto
%Vector soluci�n de con paso de 5 segundos [tt13 yy13]
'Runge Kuta 4 con paso de 5 segundos cc 0.65 primer minuto' 

puntoa = tt13(1)
puntob = tt13(13)
fa = yy13(1)
fb= yy13(13)

puntomedio = (5)/2
suma =0;

for i =2:12
  suma = yy13(i) + suma;
  suma = suma;
endfor
suma;

integralRK5cc65min1 = puntomedio*(fa + fb + 2*suma);
integralRK5cc65min1

%Metodo del trapecio para RK4 con cc=0.65 minuto 9 a 10
%Vector soluci�n de con paso de 5 segundos [tt13 yy13]
'Runge Kuta 4 con paso de 5 segundos cc 0.65 minuto 9 a 10' 

puntoa = tt13(109)
puntob = tt13(121)
fa = yy13(109)
fb= yy13(121)

puntomedio = 5/2
suma =0;

for i =110:120
  suma = yy13(i) + suma;
  suma = suma;
endfor
suma;

integralRK5cc65min9 = puntomedio*(fa + fb + 2*suma);
integralRK5cc65min9

%Metodo del trapecio para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 1 segundos [tt8 yy8]
'Runge Kuta 4 con paso de 1 segundos cc1 primer minuto' 

puntoa = tt8(1)
puntob = tt8(61)
fa = yy8(1)
fb= yy8(61)

puntomedio = 1/2
suma =0;

for i =2:60
  suma = yy8(i) + suma;
  suma = suma;
endfor
suma;

integralRK1cc1min1 = puntomedio*(fa + fb + 2*suma);
integralRK1cc1min1

%Metodo del trapecio para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 1 segundos [tt8 yy8]
'Runge Kuta 4 con paso de 1 segundos cc1 minuto 9 a 10' 

puntoa = tt8(541)
puntob = tt8(601)
fa = yy8(541)
fb= yy8(601)

puntomedio = 1/2
suma =0;

for i =542:600
  suma = yy8(i) + suma;
  suma = suma;
endfor
suma;

integralRK1cc1min9 = puntomedio*(fa + fb + 2*suma);
integralRK1cc1min9

%Metodo del trapecio para RK4 con cc=0.55 primer minuto
%Vector soluci�n de con paso de 1 segundos [tt11 yy11]
'Runge Kuta 4 con paso de 1 segundos cc 0.55 primer minuto' 

puntoa = tt11(1)
puntob = tt11(61)
fa = yy11(1)
fb= yy11(61)

puntomedio = 1/2
suma =0;

for i =2:60
  suma = yy11(i) + suma;
  suma = suma;
endfor
suma;

integralRK1cc55min9 = puntomedio*(fa + fb + 2*suma);
integralRK1cc55min9

%Metodo del trapecio para RK4 con cc=0.55 minuto 9 a 10
%Vector soluci�n de con paso de 1 segundos [tt11 yy11]
'Runge Kuta 4 con paso de 1 segundos cc 0.55 minuto 9 a 10' 

puntoa = tt11(541)
puntob = tt11(601)
fa = yy11(541)
fb= yy11(601)

puntomedio = 1/2
suma =0;

for i =542:600
  suma = yy11(i) + suma;
  suma = suma;
endfor
suma;

integralRK1cc55min9 = puntomedio*(fa + fb + 2*suma);
integralRK1cc55min9

%Metodo del trapecio para RK4 con cc=0.65 primer minuto
%Vector soluci�n de con paso de 5 segundos [tt14 yy14]
'Runge Kuta 4 con paso de 1 segundos cc 0.65' 

puntoa = tt14(1)
puntob = tt14(61)
fa = yy14(1)
fb= yy14(61)

puntomedio = 1/2
suma =0;

for i =2:60
  suma = yy14(i) + suma;
  suma = suma;
endfor
suma;

integralRK1cc65min1 = puntomedio*(fa + fb + 2*suma);
integralRK1cc65min1

%Metodo del trapecio para RK4 con cc=0.65 minuto 9 a 10
%Vector soluci�n de con paso de 5 segundos [tt14 yy14]
'Runge Kuta 4 con paso de 1 segundos cc 0.65 minuto 9 a 10' 

puntoa = tt14(541)
puntob = tt14(601)
fa = yy14(541)
fb= yy14(601)

puntomedio = 1/2
suma =0;

for i =542:600
  suma = yy14(i) + suma;
  suma = suma;
endfor
suma;

integralRK1cc65min9 = puntomedio*(fa + fb + 2*suma);
integralRK1cc65min9

   %%integral de simpson
%Metodo de simpson para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 10 segundos [tt6 yy6]
'Simpson con paso de 10 segundos cc 1 primer minuto' 

% En la siguiente matriz llamada tablaResultados
% Cada columna tiene los pasos, o sea que esta matriz tiene 3 columnas: paso 10, 5 y 1
tablaResultados = [] % Aca se guardan todos los resultados de simpson

tablaConDatos1 = [tt6(1:7)';yy6(1:7)'];
integrals10cc1min1 = simpson(10,tablaConDatos1);
tablaResultados(1,1) = integrals10cc1min1;

%Metodo de simpson para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 10 segundos [tt6 yy6]
'Simpson con paso de 10 segundos cc 1 minuto 9 a 10' 

tablaConDatos2 = [tt6(55:61)';yy6(55:61)'];
integrals10cc1min9 = simpson(10,tablaConDatos2);
tablaResultados(2,1) = integrals10cc1min9;

    %%integral de simpson
%Metodo de simpson para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 10 segundos [tt6 yy6]
'Simpson con paso de 10 segundos cc 0.55 primer minuto' 

tablaConDatos3 = [tt9(1:7)';yy9(1:7)'];
integrals10cc55min1 = simpson(10,tablaConDatos3);
tablaResultados(3,1) = integrals10cc55min1;

%Metodo de simpson para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 10 segundos [tt6 yy6]
'Simpson con paso de 10 segundos cc 0.55 minuto 9 a 10' 

tablaConDatos4 = [tt9(55:61)';yy9(55:61)'];
integrals10cc55min9 = simpson(10,tablaConDatos4);
tablaResultados(4,1) = integrals10cc55min9;

    %%integral de simpson
%Metodo de simpson para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 10 segundos [tt6 yy6]
'Simpson con paso de 10 segundos cc 0.65 primer minuto' 

tablaConDatos5 = [tt12(1:7)';yy12(1:7)'];
integrals10cc65min1 = simpson(10,tablaConDatos5);
tablaResultados(5,1) = integrals10cc65min1;

%Metodo de simpson para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 10 segundos [tt6 yy6]
'Simpson con paso de 10 segundos cc 0.55 minuto 9 a 10' 

tablaConDatos6 = [tt12(55:61)';yy12(55:61)'];
integrals10cc65min9 = simpson(10,tablaConDatos6);
tablaResultados(6,1) = integrals10cc65min9;

   %%integral de simpson
%Metodo de simpson para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 5 segundos [tt7 yy7]
'Simpson con paso de 5 segundos cc 1 primer minuto' 

tablaConDatos7 = [tt7(1:13)';yy7(1:13)'];
integrals5cc1min1 = simpson(5,tablaConDatos7);
tablaResultados(1,2) = integrals5cc1min1;

%Metodo de simpson para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 5 segundos [tt7 yy7]
'Simpson con paso de 5 segundos cc 1 minuto 9 a 10' 

tablaConDatos8 = [tt7(55:61)';yy7(55:61)'];
integrals5cc1min9 = simpson(5,tablaConDatos8);
tablaResultados(2,2) = integrals5cc1min9;

    %%integral de simpson
%Metodo de simpson para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 5 segundos [tt7 yy7]
'Simpson con paso de 5 segundos cc 0.55 primer minuto' 

tablaConDatos9 = [tt10(1:13)';yy10(1:13)'];
integrals5cc55min1 = simpson(5,tablaConDatos9);
tablaResultados(3,2) = integrals5cc55min1;

%Metodo de simpson para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 5 segundos [tt7 yy7]
'Simpson con paso de 5 segundos cc 0.55 minuto 9 a 10' 

tablaConDatos10 = [tt10(55:61)';yy10(55:61)'];
integrals5cc55min9 = simpson(5,tablaConDatos10);
tablaResultados(4,2) = integrals5cc55min9;

    %%integral de simpson
%Metodo de simpson para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 5 segundos [tt7 yy7]
'Simpson con paso de 5 segundos cc 0.65 primer minuto' 

tablaConDatos11 = [tt13(1:13)';yy13(1:13)'];
integrals5cc65min1 = simpson(5,tablaConDatos11);
tablaResultados(5,2) = integrals5cc65min1;

%Metodo de simpson para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 5 segundos [tt7 yy7]
'Simpson con paso de 5 segundos cc 0.55 minuto 9 a 10' 

tablaConDatos12 = [tt13(55:61)';yy13(55:61)'];
integrals5cc65min9 = simpson(5,tablaConDatos12);
tablaResultados(6,2) = integrals5cc65min9;

   %%integral de simpson
%Metodo de simpson para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 1 segundo [tt8 yy8]
'Simpson con paso de 1 segundo cc 1 primer minuto' 

tablaConDatos13 = [tt8(1:61)';yy8(1:61)'];
integrals1cc1min1 = simpson(1,tablaConDatos13);
tablaResultados(1,3) = integrals1cc1min1;

%Metodo de simpson para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 1 segundo [tt8 yy8]
'Simpson con paso de 1 segundo cc 1 minuto 9 a 10' 

tablaConDatos14 = [tt8(541:601)';yy8(541:601)'];
integrals1cc1min9 = simpson(1,tablaConDatos14);
tablaResultados(2,3) = integrals1cc1min9;

    %%integral de simpson
%Metodo de simpson para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 1 segundo [tt8 yy8]
'Simpson con paso de 1 segundo cc 0.541 primer minuto' 

tablaConDatos15 = [tt11(1:61)';yy11(1:61)'];
integrals1cc55min1 = simpson(1,tablaConDatos15);
tablaResultados(3,3) = integrals1cc55min1;

%Metodo de simpson para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 1 segundo [tt8 yy8]
'Simpson con paso de 1 segundo cc 0.55 minuto 9 a 10' 

tablaConDatos16 = [tt11(61:541)';yy11(61:541)'];
integrals1cc55min9 = simpson(1,tablaConDatos16);
tablaResultados(4,3) = integrals1cc55min9;

    %%integral de simpson
%Metodo de simpson para RK4 con cc=1 primer minuto
%Vector soluci�n de con paso de 1 segundo [tt8 yy8]
'Simpson con paso de 1 segundo cc 0.65 primer minuto' 

tablaConDatos17 = [tt14(1:61)';yy14(1:61)'];
integrals1cc65min1 = simpson(1,tablaConDatos17);
tablaResultados(5,3) = integrals1cc65min1;


%Metodo de simpson para RK4 con cc=1 minuto 9 a 10
%Vector soluci�n de con paso de 1 segundo [tt8 yy8]
'Simpson con paso de 1 segundo cc 0.55 minuto 9 a 10' 

tablaConDatos18 = [tt14(61:541)';yy14(61:541)'];
integrals1cc65min9 = simpson(1,tablaConDatos18);
tablaResultados(6,3) = integrals1cc65min9;

% Muestra la tabla con todos los resultados
disp('')
disp('TABLA CON RESULTADOS DE SIMPSON')
disp('      PASO 10           PASO 5             PASO 1')
disp('--------------------------------------------------')
disp(tablaResultados);

%plot(tt,ye,'g--',tt3,yy3,'b--',tt6,yy6,'r--')
%xlabel('Eje X tiempo','fontsize',12)
%ylabel('Eje y altura','fontsize',12)
%title('Comparaci�n m�todos con paso 10 segundos','fontsize',18)
%legend('Euler','Runge-Kutta 2','Runge-Kutta 4')
%xlim ([560, 600])
%ylim([1, 1.8])
 
%plot(tt,ye,'g--',tt1,ye1,'b--',tt2,ye2,'r--')
%xlabel('Eje X tiempo minutos','fontsize',12)
%ylabel('Eje y altura metros','fontsize',12)
%title('Comparaci�n Euler distintos pasos','fontsize',18)
%legend('Euler paso 10 segundos','Euler paso 5 segundos','Euler paso 1 segundo')
%xlim ([15, 30])
%ylim ([6, 7])
%print(plot)

plot(tt8,yy8,tt11,yy11,tt14,yy14)
xlabel('Tiempo(minutos)','fontsize',12)
ylabel('Altura(mts)','fontsize',12)
title('Comparacion de distintos metodos','fontsize',18)
legend('Runge-Kutta 4 paso 1 segundo Cc=1','Runge-Kutta 4 paso 1 segundo Cc=0.65','Runge-Kutta 4 paso 1 segundo Cc=0.55')
