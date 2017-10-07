function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');

	% TODO Implement your code here
for i = 1: size(test_imagenames,1)
    image = im2double(imread(strcat('../data/',test_imagenames{i})));

	% imshow(image);
	fprintf('[Getting Visual Words..]\n');
	wordMap = getVisualWords(image, filterBank, dictionary);
	h = getImageFeaturesSPM(3, wordMap, size(dictionary,2));
	distances = distanceToSet(h, train_features);
	[~,nnI] = max(distances);
	
    predicted_labels = [predicted_labels,nnI];
    
        
        
    end
    predicted_labels = train_labels(predicted_labels);
    save('test_histograms.mat','h_test');
    conf = confusionmat(test_labels,predicted_labels);
    save('confusion.mat','conf');
end