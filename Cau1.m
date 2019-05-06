function mat_tiep_dien
clc;
syms x y u real
f=input('nhap ham f(x,y)= ');
disp('Nhap lan luoc cac toa do cua M:')
x0=input('x0= ');
y0=input('y0= ');

c=subs(f,[x y],[x0 y0]); %tinh f tai M
c=double(c);

%Tinh grad tai M
nabla = gradient(f, [x,y]);
grad_tai_M = subs(nabla, [x,y], [x0 y0])

%tinh dao ham rieng tai M
fx=subs(diff(f,'x'),[x y], [x0 y0]);a=fx;
fy=subs(diff(f,'y'),[x y], [x0 y0]);b=fy;

%phuong trinh mat tiep dien
tiepdien = c + a * (x - x0) + b*(y - y0)

%ve do thi
[x,y]=meshgrid(x0-10:.1:x0+10,y0-10:.1:y0+10);
f=eval(f);
[x y f]=khu(x,y,f);
set(surf(x,y,f),'facecolor','b','edgecolor','non','facealpha',.3)
hold on

%ve mat tiep dien
f = c + a * (x - x0) + b*(y - y0);
[x y f] = khu(x,y,f);
set(surf(x,y,f),'facecolor','g','edgecolor','non','facealpha',.3)

%Cham diem M
plot3(x0,y0,c,'r.')
text(x0,y0,c+.2,['M (' num2str(x0) ',' num2str(y0) ',' num2str(c) ')'])
xlabel('x'); ylabel('y'); zlabel('z');
hold off
rotate3d on
end

function [x y f]=khu(x,y,f) % chuong trinh loai bo cac diem khong ton tai cua ham f
f=double(f);
for i=1:length(x)
    for j=1:length(y)
        if ~isreal(f(i,j))
            f(i,j)=NaN;x(i,j)=NaN;y(i,j)=NaN;
        end
    end
end
end