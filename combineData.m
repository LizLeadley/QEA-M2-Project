load allData.mat
classTrain = dataMatrix;
classTest  = testMatrix;
classTrainList = trainList;
classTestList  = testList;
load lizData.mat
dataMatrix = [classTrain dataMatrix testMatrix];
testMatrix = classTest;
trainList  = [classTrainList;repmat(string('Liz.mat'),length(trainList)+length(testList),1)];
testList   = classTestList;
save combinedData.mat dataMatrix testMatrix trainList testList
