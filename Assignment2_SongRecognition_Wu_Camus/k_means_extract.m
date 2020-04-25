function [Semitone]=k_means_extract(frIsequence)
[u re]=kmeans(frIsequence',2);  %u Data column; re: Clustering center

for i=1:length(u)
    if u(i)==1    
         plot3(frIsequence(1,i),frIsequence(2,i),frIsequence(3,i),'co'); 

    else 
         plot3(frIsequence(1,i),frIsequence(2,i),frIsequence(3,i),'yo'); 
    end
    hold on
end
hold off
%Cluster center

%get the pitches
frIsequence0=[];
n=1;
for i=1:length(u)    
    if u(i)==1
        frIsequence0(n)=frIsequence(i);
        n=n+1;
    end  
end
minbound=min(frIsequence0);
for i=1:length(u)
    if frIsequence(i)<minbound
        Semintone(i)=0
    end
    Semitone(i)=12*log2(frIsequence(i)-minbound)+1;
end
