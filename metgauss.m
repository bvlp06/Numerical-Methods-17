function rt = metgauss(A,B)
    
    cond = A(1,1); % recebe o primeiro elemento
    n=size(A); %tamanho da matriz
   
     %verifica a diagonal principal se tem algum elemento nulo
     %caso tenha, cond é igual a zero
    for i=2:n(1)
        cond=cond*A(i,i);    
    end

if (cond~=0) %se não tem elemento nulo na diagonal principal 
    %triangulação
    for k=1:(n(1)-1)
        for i=k+1:n(1)
         if(A(k,k)~=0)  
          m = A(i,k)/A(k,k); % divide os elementos abaixo do elemento da diagonal principal pelo mesmo
          A(i,k)=0; 
            for j=k+1:n(1)
                A(i,j) = A(i,j)- m*A(k,j);
            end
            B(i,1) = B(i,1) - m*B(k,1);
          end
        end
        % se a matriz já estiver triangulada, k igual a posição da ultima coluna
        if(k==(n(1)-1))
            
         x(1:n(1))=0; %vetor que guarda os valores da incognitas      
 
 %determina os valores
         x(n(1))= B(n(1),1)/A(n(1),n(1)); 
         p = (n(1)-1);
    
        while (p>=1)
         s=0;
        for j =(p+1):n(1)
            s=s + A(p,j)*x(j);
            x(p)=(B(p,1)-s)/A(p,p);
        end
         p=p-1;
        end
        h=0;
        
        for i=1:n(1)
            if( x(i)==NaN || x(i)==Inf)
            h=1;
            end
        end
        if (h==1)
            rt='não foi possivel solucionar, troque alguma coluna da matriz A e tente novamente';
        else
        rt=x;
        end
            
        end
    end
   else 
    if (cond==0)
        rt='elemento da diagonal principal nulo, troque a linha por favor';
    else
        rt='sistema impossivel';
    end
end
end