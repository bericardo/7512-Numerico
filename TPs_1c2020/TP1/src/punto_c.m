main;

matrizPromediosMensuales = minimos_mensuales(datos);

% El mes es Septiembre del año 1969 y el valor del promedio es -0.05
vectorMesMinimo = obtener_mes_minimo(matrizPromediosMensuales)

vectorFechas = convertir_fechas(matrizPromediosMensuales);
graficar(vectorFechas,matrizPromediosMensuales(:,4),"Serie Minimos Mensuales - FIUBA - 75.12");