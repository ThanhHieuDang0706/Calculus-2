syms u v x y z;
%----Phan khai bao theo de------------------
trutron=x^2+y^2-1; %Phuong trinh tru tron
cau=x^2+y^2+z^2-2; %Phuong trinh hinh cau
rt=1; % Ban kinh hinh tru
rc=sqrt(2); % Ban kinh hinh cau
intru=1; % 1 neu lay trong tru 0 neu lay ngoai tru
%----Het pPhan khai bao theo de------------------

ptgt= trutron-cau; %Phuong trinh giao tuyen
gt=solve(ptgt)
gt=double(gt);

a=gt(1);
b=gt(2);
fsurf(rt*sin(u),rt*cos(u),v,[0 2*pi a b]); % Ve tru
hold on;
c=acos(b/rc);
d=acos(a/rc);

% Ve cau
 fsurf(rc*sin(u)*cos(v),rc*sin(u)*sin(v),rc*cos(u),[0 c 0 2*pi]);
 fsurf(rc*sin(u)*cos(v),rc*sin(u)*sin(v),rc*cos(u),[d pi 0 2*pi]);
axis auto;
axis equal;
title('')