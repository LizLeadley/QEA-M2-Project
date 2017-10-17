clear
files = dir('Walking Data/*.mat');
clf
dataMatrix = zeros(350*3,length(files));
testMatrix = zeros(350*3,length(files));
nameList = [];
i = 1;
for file = files'
    load(strcat(file.folder,'\\',file.name));
    L = size(a, 1);
    Fs = mean(diff(t));
    testa  = a(1:floor(L/2),:);
    traina = a(floor(L/2)+1:end,:);
    testA  = fft(testa, 350, 1);
    trainA = fft(traina, 350, 1);
    
    nameList = [nameList; string(file.name)];
    
    testA(1,:)  = 0;
    trainA(1,:) = 0;
    
    testTheta  = angle(testA(2,:));
    trainTheta = angle(trainA(2,:));
    testOffset  = exp(-j*testTheta);
    trainOffset = exp(-j*trainTheta);
    
    testA  = testA  .* testOffset;
    trainA = trainA .* trainOffset;
    
    testA  = fftshift(testA, 1);
    trainA = fftshift(trainA, 1);
    
    testV = reshape(testA,[350*3 1]);
    trainV = reshape(trainA,[350*3 1]);
    dataMatrix(:,i) = trainV;
    testMatrix(:,i) = testV;
    i = i + 1;
end

save allData.mat dataMatrix testMatrix nameList

[U, S, V] = svd(dataMatrix, 'econ');

hold on
for i = 4:4
    f = 1:size(U,1);
    plot3(f, real(U(:,i)), imag(U(:,i)), 'b.')
end