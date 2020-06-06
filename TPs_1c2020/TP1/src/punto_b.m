main;

% Punto b del ejercicio
matrizMinimosAnuales = minimos_anuales(datos);
vectorFechas = convertir_fechas(matrizMinimosAnuales);
graficar(vectorFechas,matrizMinimosAnuales(:,4),"Serie de Minimos Anuales - FIUBA - 75.12");