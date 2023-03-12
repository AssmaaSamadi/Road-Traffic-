
L=1;
T=1;
N=100;
m=3;
h=L/(N+1);
x=[h:h:1]';
dt=T/(m+1);
a=0.8;
b=0.5;
%u=x.*sin(x);
u=x.*(x-L);
%u=exp(-200*(x-0.5).^2);
%u=x;


for t=dt:dt:T
u(N+1)=0;

i=1:N;

u(i)=(-dt*a/h)*u(i+1)+(1+(dt*a/(b*h)))*u(i)+(3*dt*a/(b*h))*u(i).*(u(i+1)-u(i))+(2*dt*a/(b*b*h))*u(i).*(u(i).*u(i)-u(i).*u(i+1));

plot(x,u);

pause(0.000001);

endfor
%plot(x,u);
