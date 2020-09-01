//Limpar tela
clc;
//Limpar histórico de variáveis
clear;
//Menu de escolha de linha
disp('1-Microfita')
disp('2-Bifilar')
disp('3-Cabo Coaxial')

//declaração de variáveis globais
mio = (4*%pi)*10^(-7)
eo = 8.85418*10 ^(-12)

//Variavel de escolha do menu
q=input("Escolha sua linha: ")

//MICROFITA
if q == 1 then
    
    //Obtenção dos parametros intríscecos da linha
    d = input("Digite a altura do substrato: ")
    w = input('Digite a largura: ')
    fw = input('Digite a frequencia angular: ')
    mir = input('Digite permeabilidade relativa: ')
    er = input('Digite permissividade relativa: ')
    condu = input("Digite a condutividade do material: ")
    Rs = sqrt((fw*mio*mir)/2*condu)
 
    //Formula dos parametros distribuidos para linha de microfita
    L = (mio*mir)*(d/w)
    C = (real(mir*mio)*(w/d))
    R = 2*(Rs/w)
    G = w*imag(eo*er)*(fw/d)
    Z0=sqrt((R + %i*fw*L)/(G+%i*fw*C))
    K = sqrt((R+%i*fw*L)*(G+%i*fw*C))

    //Apresentação dos resultados
    disp(K,'Constante de propagação')
    disp(Rs, 'Resistência superficial')
    disp(L,'Indutância')
    disp(R,'Resistência')
    disp(C,'Capacitância')
    disp(G,'Condutância')
    disp(Z0, 'Impedância ')

//BIFILAR    
elseif q==2 then
    
    //Obtenção dos parametros intríscecos da linha
    a = input("Digite o raio da linha bifilar: ")
    d = input('Digite a distancia entre as linhas: ') 
    fw = input('Digite a frequencia angular: ')
    mir = input('Digite permeabilidade relativa: ')
    er = input('Digite permissividade relativa: ')
    condu = input("Digite a condutividade do material: ")
    Rs = sqrt((fw*mio*mir)/2*condu)

    //Formula dos parametros distribuidos para linha bifilar
    L = ((mio*mir)/%pi)*(1/(cosh(d/2*a)))
    C = %pi*real(eo*er)/(1/cosh(d/2*a))
    R = Rs/(%pi*a)
    G = (%pi*fw*imag(mio*mir))/(1/cosh(d/2*a))
    Z0=sqrt((R + %i*fw*L)/(G+%i*fw*C))
    K = sqrt((R+%i*fw*L)*(G+%i*fw*C))

    //Apresentação dos resultados
    disp(K,'Constante de propagação')
    disp(Rs, 'Resistência superficial')
    disp(L,'Indutância')
    disp(R,'Resistência')
    disp(C,'Capacitância')
    disp(G,'Condutância')
    disp(Z0, 'Impedância ')
    
//COAXIAL    
elseif q==3 then
    
    //Obtenção dos parametros intríscecos da linha
    a = input("Digite o raio do condutor interno: ")
    b = input('Digite o raio do condutor externo: ') 
    fw = input('Digite a frequencia angular: ')
    mir = input('Digite permeabilidade relativa: ')
    er = input('Digite permissividade relativa: ')
    condu = input("Digite a condutividade do material: ")
    Rs = sqrt((fw*mio*mir)/2*condu)
    
    //Formula dos parametros distribuidos para cabo coaxial
    L = ((mio*mir)/2*%pi)*log(b/a)
    C = (2*%pi*real(eo*er))/log(b/a)
    R = (Rs/2*%pi)*((1/a)+(1/b))
    G = (2*%pi*fw*imag(eo*er))/log(b/a)
    Z0=sqrt((R + %i*fw*L)/(G+%i*fw*C))
    K = sqrt((R+%i*fw*L)*(G+%i*fw*C))

    
    //Apresentação dos resultados
    disp(K,'Constante de propagação')
    disp(Rs, 'Resistência superficial')
    disp(L,'Indutância')
    disp(R,'Resistência')
    disp(C,'Capacitância')
    disp(G,'Condutância')
    disp(Z0, 'Impedância ')
end
