function [alfaHat, c]=forward(mc,pX)%[alfaHat, c]=forward(mc,pX)%calculates state and observation probabilities for one single data sequence,%using the forward algorithm, for a given single MarkovChain object,%to be used when the MarkovChain is included in a HMM object.%%Input:%mc= single MarkovChain object%pX= matrix with state-conditional likelihood values,%   without considering the Markov depencence between sequence samples.%	pX(j,t)= myScale(t)* P( X(t)= observed x(t) | S(t)= j ); j=1..N; t=1..T%	(must be pre-calculated externally)%NOTE: pX may be arbitrarily scaled, as defined externally,%   i.e., pX may not be a properly normalized probability density or mass.%%NOTE: If the HMM has Finite Duration, it is assumed to have reached the end%after the last data element in the given sequence, i.e. S(T+1)=END=N+1.%%Result:%alfaHat=matrix with normalized state probabilities, given the observations:%	alfaHat(j,t)=P[S(t)=j|x(1)...x(t), HMM]; t=1..T%c=row vector with observation probabilities, given the HMM:%	c(t)=P[x(t) | x(1)...x(t-1),HMM]; t=1..T%	c(1)*c(2)*..c(t)=P[x(1)..x(t)| HMM]%   If the HMM has Finite Duration, the last element includes%   the probability that the HMM ended at exactly the given sequence length, i.e.%   c(T+1)= P( S(T+1)=N+1| x(1)...x(T-1), x(T)  )%Thus, for an infinite-duration HMM:%   length(c)=T%   prod(c)=P( x(1)..x(T) )%and, for a finite-duration HMM:%   length(c)=T+1%   prod(c)= P( x(1)..x(T), S(T+1)=END )%%NOTE: IF pX was scaled externally, the values in c are %   correspondingly scaled versions of the true probabilities.%%--------------------------------------------------------%Code Authors:%--------------------------------------------------------T=size(pX,2);%Number of observations%-------------------- continue code from here, and delete error messageN=size(pX,1);if size(mc.TransitionProb,2)==size(mc.TransitionProb,1)    alfaHat_temp=zeros(N,T);    alfaHat=zeros(N,T);    c=zeros(T,1);    for j=1:N        c(1)=sum(mc.InitialProb*pX(:,1));        alfaHat(j,1)=mc.InitialProb(j)/c1;        for t=2:T            alfaHat_temp(j,t)=pX(j,t)*sum(alfaHat(:,t-1)*mc.TransitionProb(:,j));            c(t)=sum((:,t);            alfaHat(j,t)=alfaHat_temp(j,t)/c(t);        end    endendif size(mc.TransitionProb,2)==size(mc.TransitionProb,1)+1     alfaHat_temp=zeros(N,T+1);    alfaHat=zeros(N,T+1);    c=zeros(T+1,1);    for j=1:N        c(1)=sum(mc.InitialProb*pX(:,1));        alfaHat(j,1)=mc.InitialProb(j)/c1;        for t=2:T            alfaHat_temp(j,t)=pX(j,t)*sum(alfaHat(:,t-1)*mc.TransitionProb(:,j));            c(t)=sum((:,t);            alfaHat(j,t)=alfaHat_temp(j,t)/c(t);        end        for j=T+1            c(T+1)=sum(alfaHat(:,T)*mc.TransitionProb(:,N+1))        end    endend                                        %error('Not yet implemented');end