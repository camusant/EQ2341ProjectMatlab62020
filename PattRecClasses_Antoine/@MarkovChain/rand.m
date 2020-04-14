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
%S= integer row vector with random state sequence,
%   NOT INCLUDING the END state,
%   even if encountered within T samples
%If mc has INFINITE duration,
%   length(S) == T
%If mc has FINITE duration,
%   length(S) <= T
%
%---------------------------------------------
%Code Authors: Antoine Camus
%---------------------------------------------


%----------------------------------------------------------------
%DEBUG TEST OK -Markov chain with 2 states(infinite), 3 (finite) 
%P[S=1] = [1;0]
%Test 1 Trans = [0.5,0.5 ; 0.5,0.5] (infinite), T=5
%Test 2 Trans = [0.5,0.5,0 ; 0,0.5,0.5] (finite), T=5
%Date : 04/11 Antoine Camus
%----------------------------------------------------------------

S=zeros(1,T);%space for resulting row vector
nS=mc.nStates;
szTransP = size(mc.TransitionProb);
i=1;

% error('Method not yet implemented');
if szTransP(2) == nS % INF duration
    %   1: create discrete distributions for the initial and transition
    %   Prs.
    pI = DiscreteD(mc.InitialProb);
    pS = DiscreteD(mc.TransitionProb);
    while i<=T
        if i==1
            %   2: Select the initial state
            S(i) = rand(pI,1);
        else
            %   3: Transition state
            actS = S(i-1); %actual state
            S(i) = rand(pS(actS), 1);
        end
        i=i+1;
    end
elseif szTransP(2) == nS+1 % Finite duration
    pI = DiscreteD(mc.InitialProb);
    pS = DiscreteD(mc.TransitionProb);
    End =0; %additionnal finite state
    while i<=T  && End ==0 
        if i==1
            S(i) = rand(pI, 1);
        else
            if S(i-1)~= nS+1
                actS = S(i-1); %actual state
                S(i) = rand(pS(actS), 1);
            elseif S(i-1)== nS+1   % End state
                S = S(1:i-2);
                End =1;           
            end
        end
        i=i+1;
    end
    if End ==0
        if S(T) == nS+1
            S = S(1:T-1);
        end
    end
end

end

