function [Semitone]=k_means_extract(frIsequence,k)

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
for i=1:length(u)
    if frIsequence(1,i)<minbound || u(i)==2
        Semintone(i)=0;
    else
    Semitone(i)=round(12*log2(frIsequence(1,i)/minbound))+1;
    end
end
