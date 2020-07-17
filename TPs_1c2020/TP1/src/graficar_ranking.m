clear all
close all
1;

% Carga los datos
dato = load("datos_ranking.csv");
fechas = [1:31];

% Graficador
hold on
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

% Exporta el grafico
print -djpg "ranking_bajantes_1975-2020"
