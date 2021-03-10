clear all;
1;

function res = f(x)
  res = log(x);
endfunction

x = [1 1.2 1.3 1.4 2];
y = [f(x(1)) f(x(2)) f(x(3)) f(x(4)) f(x(5))];

q0 = x;
q1 = ones(1,columns(x));
h = y;
Q = [q0' q1' h'];

w0 = power(x,2);
w1 = x;
w2 = ones(1,columns(x));
d = y;
W = [w0' w1' w2' d'];

disp('Valores m y b del polinomio de grado 1 y = mx + b:')
v = resolver_matriz(Q);
printf('m=%d\nb=%d\n',v(1),v(2));
disp('');
disp('Valores a,b y c del polinomio de grado 2 y = ax² + bx + c:')
u = resolver_matriz(W);
printf('a=%d\nb=%d\nc=%d\n',u(1),u(2),u(3));