clear
[y1, Fs1]=audioread('Songs/melody_1.wav');
[y2]=audioread('Songs/melody_2.wav');
[y3]=audioread('Songs/melody_3.wav');

%% Get music features foe each melody
[frIseq1] = GetMusicFeatures(y1,Fs1);
[frIseq2] = GetMusicFeatures(y2,Fs1);
[frIseq3] = GetMusicFeatures(y3,Fs1);

%% Features extract
[Sem1, fmin1]=k_means_extract(frIseq1);
[Sem2, fmin2]=k_means_extract(frIseq2);
[Sem3, fmin3]=k_means_extract(frIseq3);

figure(4)
subplot(3,1,1)
plot(1:length(Sem1), Sem1)
title("Semitones of melody1")
xlabel("Frame Number")
ylabel("Feature of pitches")
subplot(3,1,2)
plot(1:length(Sem2), Sem2)
title("Semitones of melody2")
xlabel("Frame Number")
ylabel("Feature of pitches")
subplot(3,1,3)
plot(1:length(Sem3), Sem3)
title("Semitones of melody3")
xlabel("Frame Number")
ylabel("Feature of pitches")





figure(5)
subplot(3,1,1)
plot(1:size(frIseq1,2), frIseq1(1,:))
title("Pitch frequency")
xlabel("Frame Number")
ylabel("Frequency(Hz)")
subplot(3,1,2)
plot(1:size(frIseq1,2), frIseq1(3,:))
title("Intensity")
xlabel("Frame Number")
ylabel("Intensity")
frIseq1(1,:)=1.5*frIseq1(1,:);
[Sem1_new]=k_means_extract(frIseq1);
subplot(3,1,3)
plot(1:length(Sem1_new), Sem1_new)
title("Semitones of melody1 after transposition")
xlabel("Frame Number")
ylabel("Feature of pitches")

figure(6)
subplot(3,1,1)
plot(1:size(frIseq2,2), frIseq2(1,:))
title("Pitch frequency")
xlabel("Frame Number")
ylabel("Frequency(Hz)")
subplot(3,1,2)
plot(1:size(frIseq2,2), frIseq2(3,:))
title("Intensity")
xlabel("Frame Number")
ylabel("Intensity")
frIseq2(1,:)=1.5*frIseq2(1,:);
[Sem2_new]=k_means_extract(frIseq2);
subplot(3,1,3)
plot(1:length(Sem2_new), Sem2_new)
title("Semitones of melody2 after transposition")
xlabel("Frame Number")
ylabel("Feature of pitches")

figure(7)
subplot(3,1,1)
plot(1:size(frIseq3,2), frIseq3(1,:))
title("Pitch frequency")
xlabel("Frame Number")
ylabel("Frequency(Hz)")
subplot(3,1,2)
plot(1:size(frIseq3,2), frIseq3(3,:))
title("Intensity")
xlabel("Frame Number")
ylabel("Intensity")
frIseq3(1,:)=1.5*frIseq3(1,:);
[Sem3_new]=k_means_extract(frIseq3);
subplot(3,1,3)
plot(1:length(Sem3_new), Sem3_new)
title("Semitones of melody3 after transposition")
xlabel("Feature of pitches")
ylabel("Pitch")

