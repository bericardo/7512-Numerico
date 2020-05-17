% Este codigo corresponde al gráfico llamado "Ranking 5 1975-2020 - FIUBA 75.12"
%
% Los datos para graficar estos datos se armo manualmente. Se copió los 31 dias
% de cada mes que aparece en el ranking en un archivo .csv y se los ploteó. 
% Para los meses que tienen menos de 31 dias, se duplicó el dato del último día
% para completar los 31 días.

clear all
close all

% Cargamos los datos
dato = load("datos_para_graficar_ranking_bajantes.csv");
fechas = [1:31];

hold on
% Graficador
plot(fechas,dato(1:31,4));
plot(fechas,dato(32:62,4));
plot(fechas,dato(63:93,4));
plot(fechas,dato(94:124,4));
plot(fechas,dato(125:155,4));

hold off

% Titulo y legendas
title("Ranking 5 1975-2020 - FIUBA - 75.12");
legend("Marzo 2020","Agosto 2001","Agosto 2009","Enero 1989","Enero 1986");

% Configuracion de absisas 
xlabel("Dia",'fontsize',10);
ylabel("Nivel Hidrometrico",'fontsize',14);
set(gca,'fontsize',20);
set(gca (), "xlim",[0,35]);

% Agrega texto incrustado
text(31.3,1.28,"1.31");
text(31.3,1.4,"1.4");
text(31,3.1,"1.47");
text(31,5,"1.54");
text(31,2.6,"1.6");

% Exportamos el grafico
print -djpg "ranking_bajantes_1975-2020"
