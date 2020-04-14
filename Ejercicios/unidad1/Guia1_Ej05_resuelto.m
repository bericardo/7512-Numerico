# GUÍA 1: EJERCICIO 5

clear all
close all

# INICIALIZACIÓN DE LAS VARIABLES
# Número al que se quiere calcular la raíz
N = 17.35; 		
# Grado de la raíz
n = 3; 			
# Cota del error relativo (Criterio de corte)
error_relativo = 0.01; 	
# Inicialización de la variable donde almacenaremos el error. La iniciamos con
# un valor grande para evitar que el ciclo se corte antes de comenzar
error_actual = 1; 
# Se crea un vector para guardar las soluciones de cada iteración. Estrictamente
# solo nos interesan en cada instante las dos últimas, pero por simplicidad
# puedo almacenar todas en este programa sencillo
sol = [];
# Se elige un valor semilla para empezar a calcular (es recomendable elegir un
# valor cercano a la solución para comenzar) y se guarda en la posición 1
# del vector.
indice = 1; 		
sol(indice) = 3;

# RESOLUCIÓN UTILIZANDO LA INSTRUCCION WHILE
while error_actual >= error_relativo    
    sol(indice+1) = sol(indice) + ((N-(sol(indice))^n)/(n*(sol(indice))^(n-1)));
    error_actual = abs((sol(indice+1) - sol(indice)) / sol(indice));
    # Se aumenta el índice en una unidad
    indice = indice + 1; 
end

# Se muestran los resultados por consola
disp('UTILIZANDO SENTENCIA WHILE')
disp('Numero a calcular la raiz:'); disp(N)
disp('Grado de la raiz:'); disp(n)
disp('Resultado:'); disp(sol(indice))
disp('Error:'); disp(error_actual)
disp('Numero de iteraciones:'); disp(indice - 1);

# ------------------------------------------------------------------------------
# Se eliminan las variables creadas. Se van a tener que inicializar nuevamente
clear all  

# INICIALIZACIÓN DE LAS VARIABLES
N = 17.35; 		
n = 3; 			
error_relativo = 0.01; 	
error_actual = 1; 
sol = [];
indice = 1; 		
sol(indice) = 3;  

# RESOLUCIÓN UTILIZANDO INSTRUCCIONES FOR, IF Y BREAK
# Se elige a priori un número grande de repeticiones porque no se sabe cuantas
# iteraciones se necesitan
for indice = 1:500 	
    sol(indice+1) = sol(indice) + ((N-(sol(indice))^n)/(n*(sol(indice))^(n-1)));
    error_actual = abs((sol(indice+1) - sol(indice)) / sol(indice));
    
    # Se corta el ciclo en el momento que se cumple la condición de la cota
    if error_actual < error_relativo
        break;		
    end
end

disp('UTILIZANDO SENTENCIA FOR, IF Y BREAK')
disp('Numero a calcular la raiz:'); disp(N)
disp('Grado de la raiz:'); disp(n)
disp('Resultado:'); disp(sol(indice + 1))
disp('Error:'); disp(error_actual)
disp('Numero de iteraciones:'); disp(indice);

