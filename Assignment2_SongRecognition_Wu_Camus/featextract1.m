% Date : 2020-04-24
% Feature extraction 1

%% Load the songs
[y1, Fs1]=audioread('Songs/melody_1.wav');
[y2]=audioread('Songs/melody_2.wav');
[y3]=audioread('Songs/melody_3.wav');
%% Get music features foe each melody
[frIseq1] = GetMusicFeatures(y1,Fs1);
[frIseq2] = GetMusicFeatures(y2,Fs1);
[frIseq3] = GetMusicFeatures(y3,Fs1);