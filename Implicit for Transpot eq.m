G=1;
Y=0.5;
n=50;

h=G/(n+1);
x=[h:h:G-h]';
c=0.5;

%discritisation en temps 
m=54;
dt=Y/(m+1);
u=exp(-200*(x-0.5).^2);

A=eye(n)+diag(((c*dt)/(2*h))*ones(n-1,1),1)+diag(((-c*dt)/(2*h))*ones(n-1,1),-1);
A=sparse(A);
[L,U]=lu(A);
for t=dt:dt:Y
  u = U\(L\(u));
  p=c*u;
  %x=[h:h:G-h]';
  %f=4*(x-c*t).*(G-x+c*t);
  %U = [U,u];
 % plot([0;x;G],[0;u;0]);
 % axis([0,1.1,0,1])
  %pause(0.0001);
endfor

f=exp(-200*(x-c*Y-0.5).^2);
g=c*f;
plot([0;x;G],[0;u;0],'o',[0;x;G],[0;p;0],'*',[0;x;G],[0;f;0],x,g);
 axis([0,1.1,0,1.2])
 legend('solution approchée','Flux approchée','solution exacte','flux exacte')
 % plot([0;x;G],[0;u;0],'o',[0;x;G],[0;p;0])%,[4*(c*T)*(L+c*T);f;4*(L-c*T)*(c*T)]);
 %legend('solution approchée','Flux approchée','exacte')
  u(38,1)
  f(38,1)