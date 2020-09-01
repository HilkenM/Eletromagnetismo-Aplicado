//Limpa a tela e os dados anteriores
clc
clear
nomes = ['WR975','WR650','WR430','WR284','WR187','WR137','WR90','WR62']
guias = [
    [9.75, 4.875],
    [6.5, 3.25],
    [4.3,2.15],
    [2.84,1.34],
    [1.872,0.872],
    [1.372,0.622],
    [0.9,0.4],
    [0.622,0.311]
];
sg=size(guias)

//Modo TMmn
m=1;n=1;

//Numero de partes
pa=20;pb=20;

//Entradas
printf("Você deseja plotar um:\n\t1-Guia de Onda da Tabela\n\t2-Guia personalizado")
op = input("Selecione uma opção:")
if(op==1)
    clc
    printf('Guias disponíveis:\n')
    for i=1:sg(1)
        printf("\t%i-%s\n",i,nomes(i))
    end
    op = input("Selecione uma opção:")
    g=guias(op,:);
    a=g(1);
    b=g(2);
elseif(op==2)
    a = input("Insira a:")
    b = input("Insira b: ")
end
//Calculo dos Betas
betax=m*%pi/a;
betay=n*%pi/b;

//Dados do gráfico de contorno .: Gráfico 1
for i=0:1:a*pa
    x(i+1)=i/pa;
    for j=0:b*pb
        y(j+1)=j/pb;
        Ez(i+1,j+1)=sin(betay*y(j+1))*sin(betax*x(i+1));
    end
end

//Dados do gráfico convencional 1, com y=b/2 .: Gráfico 2
yc1=b/2;
xc1=0:a/pa:a;
Ezc1=20*sin(betax*xc1)*sin(betay*yc1);

//Dados do gráfico convencional 2, com x=a/2 .: Gráfico 3
xc2=a/2;
yc2=0:b/pb:b;
Ezc2=20*sin(betax*xc2)*sin(betay*yc2);

//Dados do gráfico surf (3D) .: Gráfico 4
[X,Y]=meshgrid(0:a/pa:a,0:b/pb:b);
Ezs=10*sin(betax.*X).*sin(betay.*Y);

//Plotar gráfico 1
subplot(2,2,3)
contour2d(x,y,Ez,6,rect=[0,0,a,b])
title("Gráfico de curvas de nivel")
xlabel("x")
ylabel("y")

//Plotar gráfico 2
subplot(2,2,2)
plot2d(xc1,Ezc1)
title("Intensidade de Ez ao longo de a em y=b/2")
xlabel("x")
ylabel("20*Ez em y = b/2")

//Plotar gráfico 3
subplot(2,2,1)
plot2d(yc2,Ezc2)
title("Intensidade de Ez ao longo de b em x=a/2")
xlabel("y")
ylabel("20*Ez em x = a/2")

//Plotar gráfico 4
subplot(2,2,4)
surf(X,Y,Ezs)
title("Gráfico em 3d da intensidade de 10*Ez")
xlabel("x")
ylabel("y")
zlabel("10*Ez")
