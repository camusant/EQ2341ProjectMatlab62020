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
%Code Authors: Antoine Camus
%----------------------------------------------------

if numel(pD)>1
    error('Method works only for a single DiscreteD object');
end

%*** Insert your own code here and remove the following error message 
%   Possible values for distribution: 1 , 2 ... length(pD.ProbMass)
% lpD = length(pD.ProbMass);
values = 1: length(pD.ProbMass);
ProbCum = cumsum(pD.ProbMass);  %Cumulative density
rand01 = rand(1, nData); % random vector

%calculate R output vector

[~,inds] = histc(rand01,ProbCum); %Associated a value of rand01 with ProbCum
R = values(inds+1);

end
