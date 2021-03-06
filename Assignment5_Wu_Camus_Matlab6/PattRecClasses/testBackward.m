%% Finite duration test
clear all;

mc=MarkovChain([1;0],[0.9 0.1 0;0 0.9 0.1]);
X=[-0.2 2.6 1.3];
pD1=GaussD; %b_1(x)
pD2=GaussD('Mean',3,'StDev',2);
pD=[pD1;pD2];
pX=prob(pD, X);
%[alfaHat, c]=forward(mc,pX);
c= [1 0.1625 0.8266 0.0581];
betaHat=backward(mc,pX,c)


%% Infinite duration (taken from problem 5.1 of the course book)
clear all;

mc2=MarkovChain([1;0;0],[0.3 0.7 0; 0 0.5 0.5; 0 0 1]);
B =DiscreteD([1 0 0 0; 0 0.5 0.4 0.1; 0.1 0.1 0.2 0.6]);
z= [1 2 4 4 1];
pZ=prob(B, z);
[alfaHat2, c2]=forward(mc2,pZ);
betaHat2=backward(mc2,pZ,c2)