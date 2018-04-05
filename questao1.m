h=(10-0)/4;
v=0:h:10;
Y(1:5)=0;
Y(1)=0;
for i=1:4
    f=@(x)((x^2)*((v(i+1)-x)/h));
    g=@(x)((x^2)*((x-v(i))/h));
  Y(i+1)= Y(i)- intrap(v(i),v(i+1),100,f) - intrap(v(i),v(i+1),100,g);
end
disp(Y)
syms x;
fe1=(((2.5-x)/2.5)*Y(1)+((x-0)/2.5)*Y(2)) % para o intervalo 0<=x<=2.5
fe2=(((5-x)/2.5)*Y(2)+((x-2.5)/2.5)*Y(3)) % 2.5<=x<=5
fe3=(((7.5-x)/2.5)*Y(3)+((x-5)/2.5)*Y(4)) % 5<=x<=7.5
fe4=(((10-x)/2.5)*Y(4)+((x-7.5)/2.5)*Y(5)) % 7.5<=x<=10
clear f g i v h
xe1= 0:0.00001:2.5;
ye1=(((2.5-xe1)/2.5)*Y(1)+((xe1-0)/2.5)*Y(2));
xe2= 2.5:0.00001:5;
ye2=(((5-xe2)/2.5)*Y(2)+((xe2-2.5)/2.5)*Y(3));
xe3= 5:0.00001:7.5;
ye3=(((7.5-xe3)/2.5)*Y(3)+((xe3-5)/2.5)*Y(4));
xe4= 7.5:0.00001:10;
ye4=(((10-xe4)/2.5)*Y(4)+((xe4-7.5)/2.5)*Y(5));
xanalitico=0:0.0001:10;
yanalitico=-(xanalitico.^3)/3;
plot(xe1,ye1,'r',xe2,ye2,'r',xe3,ye3,'r',xe4,ye4,'r',xanalitico,yanalitico,'k')
clear xe1 xe2 xe3 xe4 ye1 ye2 ye3 ye4 x 
clear xanalitico yanalitico fe1 fe2 fe3 fe4