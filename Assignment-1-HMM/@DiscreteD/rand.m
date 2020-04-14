function R=rand(pD,nData)
%R=rand(pD,nData) returns random scalars drawn from given Discrete Distribution.
%
%Input:
%pD=    DiscreteD object
%nData= scalar defining number of wanted random data elements
%
%Result:
%R= row vector with integer random data drawn from the DiscreteD object pD
%   (size(R)= [1, nData]
%
%----------------------------------------------------
%Code Authors:
%----------------------------------------------------

if numel(pD)>1
    error('Method works only for a single DiscreteD object');
end;
pDprb = full(pD.ProbMass);
L=length(pDprb);
R0 = randsample(L, nData, true, pDprb);
R=transpose(R0);
%R = zeros(1, nData);
%cumProbs = cumsum(pD.ProbMass);

%for i = 1:nData
 %   R(i) = find(rand(1) < cumProbs, 1); 
end
%*** Insert your own code here and remove the following error message 

%error('Not yet implemented');