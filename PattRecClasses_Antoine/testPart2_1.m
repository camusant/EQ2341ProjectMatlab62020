%   Test assignment 1 part 2 
%% Definition of the variables
clear all; close all; clc;

%Markov chain
T=10000;
mcTest1 = MarkovChain([0.75 0.25],[0.99 0.01 ;0.03 0.97]);
pDgen(1)=GaussD('Mean',0 ,'StDev', 1);
pDgen(2)=GaussD('Mean' , 3 ,'StDev',2);


%% Question 2
S=rand(mcTest1,T);
tabulate(S)

%    Results OK

%% Question 3
hTest3 = HMM(mcTest1, pDgen);
[X3,S3] = rand(hTest3, 10000);
mX3 = mean(X3)
varX3 = var(X3)

%% Question 4
T4 = 500;
[X41,S41] = rand(hTest3, T4);

t =1:500;
figure(1)
plot(t,X41)
hold on
plot([0 500], [0 0], 'r')
plot([0 500], [-1 -1], 'r')
plot([0 500], [1 1], 'r')
plot([0 500], [1 1], 'g')
plot([0 500], [3 3], 'g')
plot([0 500], [5 5], 'g')
hold off
title('Question 2.4 - HMM behaviour')
xlabel('time')
ylabel('X_t')
%% Question 5
pDgen5(1)=GaussD('Mean',0 ,'StDev', 1);
pDgen5(2)=GaussD('Mean' , 0 ,'StDev',2);
hTest5 = HMM(mcTest1, pDgen5);
[X5,S5] = rand(hTest5, T4);

figure(2)
plot(t,X5)
title('Question 2.5 - HMM behaviour with m1=m2=0')
xlabel('time')
ylabel('X_t')

%% Question 6

%Now Markov Chain with finite duration states
mcTest6 = MarkovChain([0.75 0.25],[0.8 0.15 0.05;0.15 0.8 0.05]);
hTest6 = HMM(mcTest6, pDgen);
[X6,S6] = rand(hTest6, 1000);

tabulate(S6)
L6 = length(X6)

%% Question 7

% Goal have an output matrix with C =[2 1; 1,4]
pDgen7(1)=GaussD('Mean',[0 0] ,'StDev', [1 2]);
pDgen7(2)=GaussD('Mean' ,[0 0] ,'StDev',[1 2]);

hTest7 = HMM(mcTest1, pDgen7);
[X7,S7] = rand(hTest7, T);
C7 = cov(X7(1,:),X7(2,:))