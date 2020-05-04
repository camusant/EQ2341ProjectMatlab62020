mc=MarkovChain([1;0],[0.9 0.1 0;0 0.9 0.1]);
X=[-0.2 2.6 1.3];
pD1=GaussD; %b_1(x)
pD2=GaussD('Mean',3,'StDev',2);
pD=[pD1;pD2];
pX=prob(pD, X)
[alfaHat, c]=forward(mc,pX)