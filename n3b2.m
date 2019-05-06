function dao_ham_r
syms x y u real
f=input('nhap ham f(x,)= ');
disp('Nhap lan luoc cac toa do cua M0:')
x0=input('x0= ');
y0=input('y0= ');

c=subs(f,[x y],[x0 y0]); %tinh f tai M0
c=double(c);
%tinh dao ham
x=x0;y=y0;ieng
fx=diff(f,'x');a=eval(fx);
fy=diff(f,'y');b=eval(fy);
%xuat f'x va f'y
disp(['f`x= ' num2str(a)])
disp(['f`y= ' num2str(b)])
%ve do thi
[x,y]=meshgrid(x0-2:.1:x0+2,y0-2:.1:y0+2);
f=char(f);f=strrep(f,'^','.^');f=strrep(f,'*','.*');
f=eval(f);
[x y f]=khu(x,y,f);
set(surf(x,y,f),'facecolor','b','edgecolor','non','facealpha',.3)
hold on
t=linspace(-2,2,40);
x=x0+t;
y=y0+0*t;
z=c+a*t;
plot3(x,y,z,'r','linewidth',2)
x=x0+0*t;
y=y0+t;
z=c+b*t;
plot3(x,y,z,'r','linewidth',2)
text(x0,y0,c+.2,['M0 (' num2str(x0) ',' num2str(y0) ',' num2str(a) ')'])
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