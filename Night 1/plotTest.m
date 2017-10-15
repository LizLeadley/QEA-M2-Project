load HenryTest.mat
aH = aCorrect;
tH = tCorrect-tCorrect(1);
load LizTest.mat
aL = aCorrect;
tL = tCorrect-tCorrect(1);

clf
subplot(4,1,1);
plot(tH, aH);
subplot(4,1,3);
plot(tL, aL);

fS = 1/mean(diff(tH));
freqsH = linspace(-fS/2, fS/2, size(aH,1));
fS = 1/mean(diff(tL));
freqsL = linspace(-fS/2, fS/2, size(aL,1));

aHF = fftshift(fft(aH, size(aH,1), 1), 1);
aLF = fftshift(fft(aL, size(aL,1), 1), 1);
subplot(4,1,2);
plot(freqsH, abs(aHF));
subplot(4,1,4);
plot(freqsL, abs(aLF));