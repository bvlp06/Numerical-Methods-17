function rt = intrap(a,b,n,f)

h = (b-a)/n; %incremento 

x(1:n+1)=0; %vetor que guarda o pontos x's
x(1)=a; %primeiro ponto

    for i=2:n+1 
    x(i)= x(i-1)+h;   %os outros pontos
    end
a(1:8)=0; % vetor que guarda o valor de f(x(i))
    for i=2:n
    a(i-1)= f(x(i));
    end
rt=(h/2)*(2*sum(a)+f(x(1))+f(x(n+1))); %valor da integral
end