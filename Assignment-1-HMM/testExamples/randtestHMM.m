clear
nSamples=10000;
mc=MarkovChain([0.75;0.25],[0.99 0.01;0.03 0.97]);
pD1=GaussD;
pD2=GaussD('Mean',3,'StDev',2);
h=HMM(mc,[pD1;pD2]);
[X,S]=rand(h,nSamples);
E=mean(X)
var=var(X)
