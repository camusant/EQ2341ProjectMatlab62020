clear
T=10000;
mc=MarkovChain([0.75;0.25],[0.99 0.01;0.03 0.97]);
S=rand(mc,T);
tabulate(S)
