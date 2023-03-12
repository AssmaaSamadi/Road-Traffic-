
L=1;
T=0.5;
n=300;

h=L/(n+1);
x=[h:h:L-h]';
c=0.5;

%discritisation en temps 
m=50;
dt=T/(m+1);
u=exp(-200*(x-0.5).^2);

A=eye(n)+((-c*dt)/h)*eye(n)+((c*dt)/h)*diag(ones(n-1,1),-1);
A=sparse(A);

for t=dt:dt:T
  u=A*u;
  p=c*u;
% plot([0;x;L],[0;u;0],'o',[0;x;L],[0;p;0]);

 endfor 

  
  f=exp(-200*(x-c*T-0.5).^2);
g=c*f;

plot([0;x;L],[0;u;0],'o',[0;x;L],[0;p;0],[0;x;L],[0;f;0],x,g);
 legend('solution approchée','Flux approchée','densité exacte','flux exact')
 
  pause(0.0001); % krml e2dr shuf rasme 
  
  
u(38,1)
f(38,1)