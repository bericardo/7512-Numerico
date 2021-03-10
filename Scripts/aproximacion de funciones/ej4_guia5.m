clear all;
1;

x = [4.0 4.2 4.5 4.7 5.1 5.5 5.9 6.3 6.8 7.1];
y = [102.56 113.18 130.11 142.05 167.53 195.14 224.87 256.73 299.5 326.72];
q0 = ones(1,columns(x));
q1 = x;
q2 = x.**2;
q3 = x.**3;
h = y;

function y = f1(x)
  y = -194.138 + 72.0845.*x;
endfunction

function y = f2(x)
  y = 1.23556 + -1.14352.*x + 6.61821.*x.^2;
endfunction

function y = f3(x)
  y = 3.42909 + (-2.37922).*x + 6.84558.*x.^2 + -0.0136746.*x.^3;
endfunction

function y = f4(x)
  y = 24.2588.*e.^(0.372382.*x);
endfunction

function y = f5(x)
  y = 6.23903.*(x.^(2.01954));
endfunction

vecSol1 = resolver_matriz([q0' q1' h']);
printf('H*(x) = %d + %d.*x\n',vecSol1(1),vecSol1(2));
printf('Error Cuadratico:%d\n',error_cuadratico(@f1,x,y));

vecSol2 = resolver_matriz([q0' q1' q2' h']);
printf('\nH*(x) = %d + (%d).*x + %d.*x.^2\n',vecSol2(1),vecSol2(2),vecSol2(3));
printf('Error Cuadratico:%d\n',error_cuadratico(@f2,x,y));

vecSol3 = resolver_matriz([q0' q1' q2' q3' h']);
printf('\nH*(x) = %d + (%d).*x + %d.*x.^2 + %d.*x.^3\n',vecSol3(1),vecSol3(2),vecSol3(3),vecSol3(4));
printf('Error Cuadratico:%d\n',error_cuadratico(@f3,x,y));

vecSol4 = resolver_matriz([q0' q1' (log(h))']);
printf('\nH*(x) = %d.*e.^(%d.*x)\n',e.^(vecSol4(1)),vecSol4(2));
printf('Error Cuadratico:%d\n',error_cuadratico(@f4,x,y));

vecSol5 = resolver_matriz([q0' (log(q1))' (log(h))']);
printf('\nH*(x) = %d.*x.^(%d)\n',e.^(vecSol5(1)),vecSol5(2));
printf('Error Cuadratico:%d\n',error_cuadratico(@f5,x,y));