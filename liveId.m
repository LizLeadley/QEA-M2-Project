load combinedData.mat
dataMatrix = abs(dataMatrix);
meanGait = mean(dataMatrix,2);
dataMatrix = dataMatrix-meanGait;
sizeTr = length(trainList);
sizeTe = length(testList);
nClasses = sizeTe;

[U,S,V] = svd(dataMatrix,'econ');
U = U(:,1:nClasses-1);
coeffMatrix = U'*dataMatrix;

answers = [];

while(1)
    testGait = getGait() - meanGait;
    testAnswer = 'Unknown Gait';
    testCoeff = U'*testGait;

    % find closest match index for just the one gait
    differences = zeros(1,sizeTr);
    for i = 1:sizeTr
        differences(i) = norm(coeffMatrix(:,i)-testCoeff);
    end
    [minComparison, indexGuessed] = min(differences);
    disp(trainList(indexGuessed));
    clf
    subplot(2,1,1)
    plot(abs(testGait));
    title(testAnswer)
    subplot(2,1,2)
    plot(abs(dataMatrix(:,indexGuessed)));
    title(trainList(indexGuessed));
end