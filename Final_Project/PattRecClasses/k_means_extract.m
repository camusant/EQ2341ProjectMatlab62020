function [Semitone, minVoicedfreq]=k_means_extract(frIsequence,k)

%%%%%%%%%%%%%%%%%%%%%%%%
% function k_means_extract
% This function extracts the semitones into a vector Semitone based on the
% minimum voiced frequency minVoicedfreq.
%
% INPUTS
% * frIsequence, matrix of size 3*#Frames features extracted from
% GetMusicFeatures
%   1st line : pitch frequency of the frame
%   2nd line : correlation of the pitch period
%   3rd line : intensity of the sound of the frame
% * k, int,  number of wanted componenets for k-means classification
%
% OUTPUTS
% * Semitone, vector of int, represents the semitones values 
% =0 if silence or pause
% =1 if min voiced frequency
% * minVoicedfreq, double, minimum voiced frequency
%
%%%%%%%%%%%%%%%%%%%%%%%%

if nargin == 1
    k=2;
end

[u re]=kmeans(frIsequence',k);  %u: Data column; re: Clustering center

%for i=1:length(u)
%    if u(i)==1    
%         plot3(frIsequence(1,i),frIsequence(2,i),frIsequence(3,i),'co'); 

%    else 
%         plot3(frIsequence(1,i),frIsequence(2,i),frIsequence(3,i),'yo'); 
%    end
%    hold on
%end
%hold off
%Cluster center

%get the pitches
frIsequence0=[];
n=1;
for i=1:length(u)    
    if u(i)==1
        frIsequence0(n)=frIsequence(1,i);
        n=n+1;
    end  
end
minbound=min(frIsequence0);
minVoicedfreq = minbound;
for i=1:length(u)
    if frIsequence(1,i)<minbound || u(i)==2
        Semintone(i)=0;
    else
    Semitone(i)=round(12*log2(frIsequence(1,i)/minbound))+1;
    end
end
Semitone = Semitone+1;   % Correction to avoid an error with the zero during the training (1=silence)
end
