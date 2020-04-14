%   Test assignment 1 part 2 
%% Definition of the variables

%Markov chain
T=10000;
mcTest1 = MarkovChain([0.75 0.25],[0.99 0.01 ;0.03 0.97]);
pDgen(1)=GaussD('Mean',0 ,'StDev', 1);
pDgen(2)=GaussD('Mean' , 3 ,'StDev',2);


%% Question 2
S=rand(mcTest1,T);
tabulate(S)

%    Results OK

%% 