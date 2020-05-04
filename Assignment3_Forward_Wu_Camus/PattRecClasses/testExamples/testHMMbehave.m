clear
%2.4
nSamples=500;
mc=MarkovChain([0.75;0.25],[0.99 0.01;0.03 0.97]);
pD1=GaussD;
pD2=GaussD('Mean',3,'StDev',2);
h=HMM(mc,[pD1;pD2]);
[X,S]=rand(h,nSamples);
subplot(2,1,1)
plot(1:nSamples,X);
xlabel("t")
ylabel("X_t")
title('Question 2.4 - HMM behaviour with \mu_1=0, \mu_2=3','FontWeight','bold')

%2.5
pD1=GaussD;
pD2Test=GaussD('Mean',0,'StDev',2);
hTest=HMM(mc,[pD1;pD2Test]);
[XTest,STest]=rand(hTest,nSamples);
subplot(2,1,2)
plot(1:nSamples,XTest);
xlabel("t")
ylabel("X_t")
title('Question 2.5 - HMM behaviour with \mu_1=\mu_2=3','FontWeight','bold')