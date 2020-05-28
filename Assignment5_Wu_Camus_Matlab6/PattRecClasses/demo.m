%% Recording voice
Fs=22050;
r=audiorecorder(Fs, 16, 1);
disp('Please recording')
recordblocking(r,5);     % hum into microphone...
stop(r);
disp('Record finish')
p = play(r) ;  % listen to complete recording

%% show features
S=string({'hum','voic'});
s=[1 2];
frIseqtemp= GetMusicFeatures(r.getaudiodata,Fs);
[Semi, frmin]=k_means_extract(frIseqtemp);    
logP=hmms.logprob(Semi);
plot(s,logP,'r');
index=find(logP==max(logP));
disp('This song is ')
disp(S(index))

