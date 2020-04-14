clear
%2.3
nSamples=10000;
mc=MarkovChain([0.75;0.25],[0.99 0.01;0.03 0.97]);
pD1=GaussD;
pD2=GaussD('Mean',3,'StDev',2);
h=HMM(mc,[pD1;pD2]);
[X,S]=rand(h,nSamples);
E=mean(X)
var=var(X)

%2.6
mcTest=MarkovChain([0.75;0.25],[0.99 0.005 0.005;0.03 0.96 0.01]);
hTest=HMM(mcTest,[pD1;pD2]);
[XTest,STest]=rand(hTest,nSamples);
tabulate(STest)
L=length(STest)

%2.7test for  Gaussian vector distributions
pD1=GaussD('Mean',[0 1],'StDev',[1 2]);
pD2=GaussD('Mean',[0 3],'StDev',[1 2]);
h=HMM(mc,[pD1;pD2]);
[X,S]=rand(h,100);
C=cov(X(:,:,1),X(:,:,2))
