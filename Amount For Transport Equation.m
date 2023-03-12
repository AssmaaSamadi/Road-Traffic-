L=1;
T=0.5;
n=100;

h=L/(n+1);
x=[h:h:L-h]';
c=0.8;

%discritisation en temps
m=54;
dt=T/(m+1);
u=exp(-200*(x-0.5).^2);

A=eye(n)+((-c*dt)/h)*eye(n)+((c*dt)/h)*diag(ones(n-1,1),-1);
A=sparse(A);

for t=dt:dt:T
 F=zeros(n,1);
F(1,1)=(c*dt/h)*(0.08*t*t+exp(-200*(0.5).^2));

 u=A*u+F;
  p=c*u;
% plot([0;x;L],[0;u;0],'o',[0;x;L],[0;p;0]);

 endfor


  f=exp(-200*(x-c*T-0.5).^2);


plot([0;x;L],[0;u;0],[0;x;L],[0;p;0],[0;x;L],[0;f;0]);
 legend('solution approch�e','Flux approch�e','exacte')
 axis([0,1.3,0,1.1])
  pause(0.0001); % To see the figure


