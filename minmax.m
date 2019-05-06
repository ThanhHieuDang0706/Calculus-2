grid on
hold on
clc;
syms x y lamda phi r i f k p m n
% Ve tru tron
fsurf(5*cos(phi),5*sin(phi),r,[-30 30],'facealpha',0.3);
f = x^2 - y^2;
g= x^2+y^2-25;
% Ve mat cong
fsurf(f,'facealpha',0.3)
% Tim diem dung
A1 = diff(f,x);
A2 = diff(f,y);
nghiem = solve(A1,A2,x,y); % luu nghiem duoi dang struct
x1 = nghiem.x
y1 = nghiem.y

% Kiem tra xem co nam trong mien D
if ((x1^2+y1^2) < 25)
   kq=subs(subs(f,x1),y1);
end

L = f + lamda*g; % Ham Larange
Lx = diff(L,x);
Ly = diff(L,y);
nghiem = solve(Lx,Ly,g,x,y,lamda) % Co 4 bo nghiem
X=nghiem.x % Gan nghiem vao X Y
Y=nghiem.y

for i=1:4 % lap qua tung bo nghiem de tinh ket qua cua f tai X va Y
    gt(i) = subs(subs(f,X(i)),Y(i));
end
gt(5) = kq; % luu ket qua f tai diem dung vao gt de so sanh
X(5) = x1;
Y(5) = y1;

[k,p] = max(gt);
[m,n] = min(gt);

GTLN = k
% Tim tat ca cac diem f co gia tri max
for i=1:5
    if (k==gt(i))
        disp('tai [x,y] = ')
        disp([X(i) Y(i)]) 
 scatter3(double(X(i)),double(Y(i)),gt(i),'filled','o') % Danh dau diem GTLN = mau xanh
    end
end
    
GTNN = m
% Tim tat ca cac diem f co gia tri min
for i=1:5
    if (m==gt(i))
        disp('tai [x,y] = ')
        disp([X(i) Y(i)]) 
        scatter3(double(X(i)),double(Y(i)),gt(i),'filled','o') % danhdau GTNN = mau do
    end
end 

hold off
