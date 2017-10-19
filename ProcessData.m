clear
files = dir('Liz Data/*.mat');
clf
n = 5;
dataMatrix = zeros(700/n*3,length(files)*(n-1));
testMatrix = zeros(700/n*3,length(files));
testList = [];
trainList = [];
i = 1;
for file = files'
    load(strcat(file.folder,'\\',file.name));
    L = size(a, 1);
    Fs = mean(diff(t));
    p = floor(L/n);
    
    part1 = a(1:p,:);
    part2 = a(p+1:2*p,:);
    part3 = a(2*p+1:3*p,:);
    part4 = a(3*p+1:4*p,:);
    part5 = a(4*p+1:end,:);
    
    testList = [testList; string(file.name)];
    trainList = [trainList; string(file.name); string(file.name); string(file.name); string(file.name)];
    
    A1 = (fft(part1,700/n,1));
    A2 = (fft(part2,700/n,1));
    A3 = (fft(part3,700/n,1));
    A4 = (fft(part4,700/n,1));
    A5 = (fft(part5,700/n,1));
    
    A1(1,:) = 0;
    A2(1,:) = 0;
    A3(1,:) = 0;
    A4(1,:) = 0;
    A5(1,:) = 0;
    
    A1 = fftshift(A1,1);
    A2 = fftshift(A2,1);
    A3 = fftshift(A3,1);
    A4 = fftshift(A4,1);
    A5 = fftshift(A5,1);
    
    V1 = reshape(A1,[700/n*3 1]);
    V2 = reshape(A2,[700/n*3 1]);
    V3 = reshape(A3,[700/n*3 1]);
    V4 = reshape(A4,[700/n*3 1]);
    V5 = reshape(A5,[700/n*3 1]);
    dataMatrix(:,(i-1)*4+1:(i-1)*4+4) = [V1 V2 V3 V4];
    testMatrix(:,i) = V5;
    i = i + 1;
end

save lizData.mat dataMatrix testMatrix testList trainList

[U, S, V] = svd(dataMatrix, 'econ');

hold on
for i = 4:4
    f = 1:size(U,1);
    plot3(f, real(U(:,i)), imag(U(:,i)), 'b.')
end