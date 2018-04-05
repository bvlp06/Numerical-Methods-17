% vetor que caracteriza o nó
TIPO_DE_NO(1:13)=-1;
TIPO_DE_NO(1)=0;
TIPO_DE_NO(2)=2;
TIPO_DE_NO(3)=2;
TIPO_DE_NO(4)=2;
TIPO_DE_NO(5)=2;
TIPO_DE_NO(6)=1;
TIPO_DE_NO(7)=2;
TIPO_DE_NO(8)=1;
TIPO_DE_NO(9)=0;
TIPO_DE_NO(10)=2;
TIPO_DE_NO(11)=2;
TIPO_DE_NO(12)=0;
TIPO_DE_NO(13)=1;

% COMO k cresce de 10 em 10..
k=10:10:150;
%como visto na figura 1.1, segue a matriz de adjacencia referente a questão 2
%sistema inicial
K(1:13,1:13)=0;
K(1,1)=k(1)+k(3);
K(1,4)=-k(1);
K(1,6)=-k(3);
K(2,2)=k(2)+k(5)+k(6);
K(2,6)=-k(2)-k(6);
K(2,7)=-k(5);
K(3,3)=k(7)+k(10);
K(3,8)=-k(7);
K(3,10)=-k(10);
K(4,1)=-k(1);
K(4,4)=k(1)+k(4);
K(4,5)=-k(4);
K(5,4)=-k(4);
K(5,5)=k(4)+k(15);
K(5,8)=-k(15);
K(6,1)=-k(3);
K(6,2)=-k(2)-k(6);
K(6,6)=k(3)+k(2)+k(6);
K(7,2)=-k(5);
K(7,7)=k(5)+k(9);
K(7,13)=-k(9);
K(8,3)=-k(7);
K(8,5)=-k(15);
K(8,8)=k(15)+k(7)+k(8);
K(8,11)=-k(8);
K(9,9)=k(11)+k(12)+k(13);
K(9,11)=-k(11);
K(9,13)=-k(12)-k(13);
K(10,3)=-k(10);
K(10,10)=k(10)+k(14);
K(10,12)=-k(14);
K(11,8)=-k(8);
K(11,9)=-k(11);
K(11,11)=k(8)+k(11);
K(12,10)=-k(14);
K(12,12)=k(14);
K(13,7)=-k(9);
K(13,9)=-k(12)-k(13);
K(13,13)=k(9)+k(12)+k(13);

%aplicando as condições de contorno (eliminando as linhas e colunas 1 9 e 12)
if (TIPO_DE_NO(1)==0 && TIPO_DE_NO(9)==0 && TIPO_DE_NO(12)==0)
K([1 9 12],:)=[];
K(:,[1 9 12])=[];
end
%matriz coluna das forças
F(1:10,1)=0;
F(5,1)=-40;
F(7,1)=-50;
F(10,1)=-60;

%encontrando os deslocamentos
x=metgauss(K,F);

%lembrando que os pontos 1, 9 e 12 são fixos (nao tem deslocamento), logo
for i=1:11
   if(i~=11)
    x(12-i)=x(11-i);
   end
end
x(1)=0;
for i=1:12
   if(i<4)
    x(13-i)=x(12-i);
   end
end
x(9)=0;
for i=1:13
   if(i<2)
    x(14-i)=x(13-i);
   end
end
x(12)=0;
disp(x)  %% em centimetros

% vetor Fels de força elastica
Fels(1)=-k(1)*(x(1)-x(4));
Fels(2)=-k(2)*(x(6)-x(2));
Fels(3)=-k(3)*(x(1)-x(6));
Fels(4)=-k(4)*(x(4)-x(5));
Fels(5)=-k(5)*(x(2)-x(7));
Fels(6)=-k(6)*(x(6)-x(2));
Fels(7)=-k(7)*(x(8)-x(3));
Fels(8)=-k(8)*(x(8)-x(11));
Fels(9)=-k(9)*(x(7)-x(13));
Fels(10)=-k(10)*(x(3)-x(10));
Fels(11)=-k(11)*(x(11)-x(9));
Fels(12)=-k(12)*(x(13)-x(9));
Fels(13)=-k(13)*(x(13)-x(9));
Fels(14)=-k(14)*(x(10)-x(12));
Fels(15)=-k(15)*(x(5)-x(8));
disp(Fels)
%força Ni com i = 1, 9 e 12 (força (de reações/normais) de superfície i)
N1=k(1)*(x(1)-x(4))+k(3)*(x(1)-x(6));
N9=k(11)*(x(9)-x(11))+k(12)*(x(9)-x(13))+k(13)*(x(9)-x(13));
N12=k(14)*(x(12)-x(10));
disp(N1)
disp(N9)
disp(N12)
clear F i k K