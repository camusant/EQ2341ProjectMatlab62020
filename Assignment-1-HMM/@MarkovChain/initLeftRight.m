%function mc=initLeftRight(mc,nStates,stateDuration);%Initialize a single MarkovChain object%to a finite-duration first-order left-right structure%allowing transitions from every state only to%the nearest following state.%%Input:%mc=        the MarkovChain object%nStates=   desired number of Markov states%stateDuration= (optional) average number of consecutive samples in each state%               length(stateDuration)==nStates OR ==1        %%Result:%mc=       the initialized MarkovChain object%%Arne Leijon 2011-08-02 testedfunction mc=initLeftRight(mc,nStates,stateDuration)defaultDuration=10;%if stateDuration not givenif nStates<=1	error('Number of states must be >1');end;if nargin<3||isempty(stateDuration)    stateDuration=defaultDuration;end;if length(stateDuration)==1    stateDuration=repmat(stateDuration,nStates,1);elseif length(stateDuration)~= nStates    error('Incompatible length of state durations');end;minDiagProb=0.1;%initial min diagonal TransitionProb value%D=max(1,stateDuration);aii=max(minDiagProb,(D-1)./D);%diagonal values of TransitionProb matrixaij=(1-aii);%off-diagonal values, only one non-zero off-diagonalA=sparse(1:nStates,1:nStates,aii,nStates,nStates+1)+sparse(1:nStates,2:nStates+1,aij);% aij=diag(aij,1);% aij=aij(1:nStates,:);% A=[diag(aii),zeros(nStates,1)]+aij;%p0=[1;zeros(nStates-1,1)];p0=sparse(1,1,1,nStates,1);mc.InitialProb=p0;mc.TransitionProb=A;