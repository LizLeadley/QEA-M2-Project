clear
files = dir('Walking Data/*.mat');
clf
dataMatrix = zeros(350*3,length(files));
testMatrix = zeros(350*3,length(files));
i = 1;
for file = files'
    load(strcat(file.folder,'\\',file.name));
    L = size(a, 1);
    Fs = mean(diff(t));
    testa  = a(1:floor(L/2),:);
    traina = a(floor(L/2)+1:end,:);
    testA  = fftshift(fft(testa, 350, 1), 1);
    trainA = fftshift(fft(traina, 350, 1), 1);
    testV = reshape(testA,[350*3 1]);
    trainV = reshape(trainA,[350*3 1]);
    dataMatrix(:,i) = trainV;
    testMatrix(:,i) = testV;
    hold on
    plot(abs(testV))
    i = i + 1;
end

save allData.mat dataMatrix testMatrix