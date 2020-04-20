clear
%2.2 Verify MarkovChain
T=10000; %length of sate sequence S
mc=MarkovChain([0.75;0.25],[0.99 0.01;0.03 0.97]); %generate MarkovChain using given example
S=rand(mc,T); %generate random state sequence
tabulate(S) %calculate the value appeared in sequence and the frequency, and calculate the pecentage.

%2.3 Verify HMM
nSamples1=10000; %length of sequence 
pD1=GaussD; %b_1(x)
pD2=GaussD('Mean',3,'StDev',2); %b_2(x)
h1=HMM(mc,[pD1;pD2]); % build HMM object
[X1,S1]=rand(h1,nSamples1); %generate random sequence
E=mean(X1) % calculate mean of output sequence
var=var(X1) % calculate variance of output sequence

%2.4 Plot HMM output sequence
nSamples2=500; %length of sequence
[X2,S2]=rand(h1,nSamples2);
% plot HMM output X_t with given parameters and add title , xlabel, ylabel
subplot(2,1,1)
plot(1:nSamples2,X2); 
xlabel("t")
ylabel("X_t")
title('Question 2.4 - HMM behaviour with \mu_1=0, \mu_2=3','FontWeight','bold')

%2.5 Plot HMM output sequence with same mean
pD2Test=GaussD('Mean',0,'StDev',2); % generate new Gaussian random value with same mean to pD1
h3=HMM(mc,[pD1;pD2Test]); 
[X3,S3]=rand(h3,nSamples2);
subplot(2,1,2)
plot(1:nSamples2,X3);
xlabel("t")
ylabel("X_t")
title('Question 2.5 - HMM behaviour with \mu_1=\mu_2=3','FontWeight','bold')

%2.6 Check for finite-duration HMM
mc4=MarkovChain([0.75;0.25],[0.99 0.005 0.005;0.03 0.96 0.01]); % create transition matrix with exit state
h4=HMM(mc4,[pD1;pD2]);
[X4,S4]=rand(h4,nSamples);
tabulate(S4)
L=length(S4) %if L <= nSamples, this means the sequence reach exit state during the procedure, otherwise it should always be equal to nSamples

%2.7 Test for  Gaussian vector distributions
% first generate random Gaussian vectors, this can be done by setting mean
% and variance, or set values of mean and covariance.
pD3=GaussD('Mean',[0 1],'StDev',[1 2]); 
pD4=GaussD('Mean',[0 1],'StDev',[3 4]);
h5=HMM(mc,[pD3;pD4]);
[X5,S5]=rand(h5,nSamples);
size=size(X5);
C=cov(X5(:,1),X5(:,2)) %calculate covariance and print, it should not be diagonal matrix. 
