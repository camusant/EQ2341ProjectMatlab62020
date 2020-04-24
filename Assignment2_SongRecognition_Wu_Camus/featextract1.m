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

figure(1)
subplot(2,1,1)
plot(1:size(frIseq1,2), frIseq1(1,:))
title("Pitch frequency")
xlabel("Frame Number")
ylabel("Frequency(Hz)")
subplot(2,1,2)
plot(1:size(frIseq1,2), frIseq1(3,:))
title("Intensity")
xlabel("Frame Number")
ylabel("Intensity")

figure(2)
subplot(2,1,1)
plot(1:size(frIseq2,2), frIseq2(1,:))
title("Pitch frequency")
xlabel("Frame Number")
ylabel("Frequency(Hz)")
subplot(2,1,2)
plot(1:size(frIseq2,2), frIseq2(3,:))
title("Intensity")
xlabel("Frame Number")
ylabel("Intensity")

figure(3)
subplot(2,1,1)
plot(1:size(frIseq3,2), frIseq3(1,:))
title("Pitch frequency")
xlabel("Frame Number")
ylabel("Frequency(Hz)")
subplot(2,1,2)
plot(1:size(frIseq3,2), frIseq3(3,:))
title("Intensity")
xlabel("Frame Number")
ylabel("Intensity")