g = 9.81;
R = 4;
r = 0.12;

f = @(t,x) -(((r^2)*sqrt(2*g*x))/((2*x*R)-((x)^2)));

euler(0,6.5,10,@f)