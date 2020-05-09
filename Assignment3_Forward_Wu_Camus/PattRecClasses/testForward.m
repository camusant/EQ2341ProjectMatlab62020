%% Finite duration test
clear all;

mc=MarkovChain([1;0],[0.9 0.1 0;0 0.9 0.1]);
X=[-0.2 2.6 1.3];
pD1=GaussD; %b_1(x)
pD2=GaussD('Mean',3,'StDev',2);
pD=[pD1;pD2];
pX=prob(pD, X);
[alfaHat, c]=forward(mc,pX)
h=HMM(mc,pD);
logP=logprob(h,X)

%% Infinite duration (taken from problem 5.1 of the course book)
clear all;

mc2=MarkovChain([1;0;0],[0.3 0.7 0; 0 0.5 0.5; 0 0 1]);
B =DiscreteD([1 0 0 0; 0 0.5 0.4 0.1; 0.1 0.1 0.2 0.6]);
z= [1 2 4 4 1];
pZ=prob(B, z);
[alfaHat2, c2]=forward(mc2,pZ)
hmm2=HMM(mc2,B);
logP2=logprob(hmm2,z)