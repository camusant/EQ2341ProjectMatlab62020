clear
%2.2 Verifying MarkovChain
T=10000; %length of sate sequence S
mc=MarkovChain([0.75;0.25],[0.99 0.01;0.03 0.97]); %generate MarkovChain using given HMM 
S=rand(mc,T); %generate random sequence with length T and the MarkovChain generated above
tabulate(S) %calculate the value appeared in sequence and the frequency, and calculate the pecentage.
