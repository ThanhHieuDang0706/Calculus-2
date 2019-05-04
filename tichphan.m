% De: Tinh tich phan duong Sc(dau tich phan) ydx - x^2dy voi C 
% la y = 4 - x^2 tu A(2,0) den B(0,4)
clc;
syms x y;
A = [2 0];
B = [0 4];
y = 4 - x^2;
int ( y* diff(x) + x^2 * diff(y),A(1),B(1))