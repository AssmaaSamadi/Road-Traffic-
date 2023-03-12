L=1;
T=1;
n=100;
m=1000;
h=L/(n+1);
x=[h:h:L-h]';
dt=T/(m+1);
c=0.5;
u=(x-4).*exp(-200*(x-0.5).^2);
A=(-2*c*dt/(h*h))*eye(n)+eye(n)+(c*dt/(h*h))*(diag(ones(n-1,1),1)+diag(ones(n-1,1),-1));
A=sparse(A);
B=(-c/h)*eye(n)+(c/h)*diag(ones(n-1,1),-1);
B=sparse(B);

for t=dt;dt;T-dt

  u=A*u;
  p=B*u;

endfor

 plot(x,p)
 legend('Flux Approché')