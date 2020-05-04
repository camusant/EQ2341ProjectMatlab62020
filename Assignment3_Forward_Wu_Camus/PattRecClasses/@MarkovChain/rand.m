function S=rand(mc,T)
%S=rand(mc,T) returns a random state sequence from given MarkovChain object.
%
%Input:
%mc=    a single MarkovChain object
%T= scalar defining maximum length of desired state sequence.
%   An infinite-duration MarkovChain always generates sequence of length=T
%   A finite-duration MarkovChain may return shorter sequence,
%   if END state was reached before T samples.
%
%Result:
%S=  
%   NOT INCLUDING the END state,
%   even if encountered within T samples
%If mc has INFINITE duration,
%   length(S) == T
%If mc has FINITE duration,
%   length(S) <= T
%
%---------------------------------------------
%Code Authors:
%---------------------------------------------

S=zeros(1,T);%space for resulting row vector
nS=mc.nStates;

%error('Method not yet implemented');
Initial=DiscreteD(mc.InitialProb);%get the initial state
S(1)=rand(Initial,1);%choose random one to be the first state
End=0;
i=2;

if size(mc.TransitionProb,2)==size(mc.TransitionProb,1)+1 
    while i<=T && End==0
        Transitionstate=DiscreteD(mc.TransitionProb(S(i-1),:)); % get the transition vector
        S(i)=rand(Transitionstate,1);
        if S(i)==nS+1
            S=S(1:i-1);
            End=1;
        end
        i=i+1;
    end
end
if size(mc.TransitionProb,2)==size(mc.TransitionProb,1)
    for i=2:T
        Transitionstate=DiscreteD(mc.TransitionProb(S(i-1),:)); % get the transition vector
        S(i)=rand(Transitionstate,1); % choose random one to be current state
    end
end
end
%continue code from here, and erase the error message........


