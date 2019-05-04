function mat_tiep_dien
syms x y real
f=input('nhap ham f(x,y)= ');
disp('phap lan luoc cac toa do cua M:')
x0=input('x0= ');
y0=input('y0= ');

c=subs(f,[x y],[x0 y0]); %tinh f tai M
c=double(c);

%Tinh grad tai M
nabla = gradient(f, [x,y])
grad_tai_M = subs(nabla, [x,y], [x0 y0])

%tinh dao ham
fx=subs(diff(f,'x'), [x y], [x0 y0]);a=eval(fx);
fy=subs(diff(f,'y'), [x y], [x0 y0]);b=eval(fy);


%ve do thi
[x,y]=meshgrid(x0-5:.2:x0+5,y0-5:.2:y0+5);
f=char(f);f=strrep(f,'^','.^');f=strrep(f,'*','.*');
f=eval(f);
[x y f]=khu(x,y,f);
set(surf(x,y,f),'facecolor','b','edgecolor','non','facealpha',.3)
hold on

%Ve diem M
plot3(x0,y0,c,'o')

%mat tiep dien
tiepdien = c + a .* (x - x0) + b.*(y - y0);
[x y tiepdien] = khu(x,y,tiepdien);
surf(x,y,tiepdien,'facecolor','g','edgecolor','non','facealpha',.3)

% Ve tiep tuyen
t=linspace(-3,3,40); 
x=x0+t;
y=y0+0.*t;
z=c+a.*t;
plot3(x,y,z,'r','linewidth',2)
x=x0+0.*t;
y=y0+t;
z=c+b.*t;
plot3(x,y,z,'k','linewidth',2)

legend('Mat cong', 'Diem M', 'Mat tiep dien', 'Tiep tuyen T1', 'Tiep tuyen T2');
xlabel('x'); ylabel('y');zlabel('z');
text(x0,y0,c+.2,['M (' num2str(x0) ',' num2str(y0) ',' num2str(c) ')'])
hold off
rotate3d on
end

function [x y f]=khu(x,y,f) % chuong trinh loai bo cac diem khong ton tai cua ham f
for i=1:length(x)
    for j=1:length(y)
        if ~isreal(f(i,j))
            f(i,j)=NaN;x(i,j)=NaN;y(i,j)=NaN;
        end
    end
end
end