# GU�A 1: EJERCICIO 5

clear all
close all

# INICIALIZACI�N DE LAS VARIABLES
# N�mero al que se quiere calcular la ra�z
N = 17.35; 		
# Grado de la ra�z
n = 3; 			
# Cota del error relativo (Criterio de corte)
error_relativo = 0.01; 	
# Inicializaci�n de la variable donde almacenaremos el error. La iniciamos con
# un valor grande para evitar que el ciclo se corte antes de comenzar
error_actual = 1; 
# Se crea un vector para guardar las soluciones de cada iteraci�n. Estrictamente
# solo nos interesan en cada instante las dos �ltimas, pero por simplicidad
# puedo almacenar todas en este programa sencillo
sol = [];
# Se elige un valor semilla para empezar a calcular (es recomendable elegir un
# valor cercano a la soluci�n para comenzar) y se guarda en la posici�n 1
# del vector.
indice = 1; 		
sol(indice) = 3;

# RESOLUCI�N UTILIZANDO LA INSTRUCCION WHILE
while error_actual >= error_relativo    
    sol(indice+1) = sol(indice) + ((N-(sol(indice))^n)/(n*(sol(indice))^(n-1)));
    error_actual = abs((sol(indice+1) - sol(indice)) / sol(indice));
    # Se aumenta el �ndice en una unidad
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

# INICIALIZACI�N DE LAS VARIABLES
N = 17.35; 		
n = 3; 			
error_relativo = 0.01; 	
error_actual = 1; 
sol = [];
indice = 1; 		
sol(indice) = 3;  

# RESOLUCI�N UTILIZANDO INSTRUCCIONES FOR, IF Y BREAK
# Se elige a priori un n�mero grande de repeticiones porque no se sabe cuantas
# iteraciones se necesitan
for indice = 1:500 	
    sol(indice+1) = sol(indice) + ((N-(sol(indice))^n)/(n*(sol(indice))^(n-1)));
    error_actual = abs((sol(indice+1) - sol(indice)) / sol(indice));
    
    # Se corta el ciclo en el momento que se cumple la condici�n de la cota
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

