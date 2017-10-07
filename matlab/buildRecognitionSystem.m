function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('../data/traintest.mat');

	% TODO create train_features
    batchToVisualWords(4);
    %Load the train wordmaps and convert them to histogram features
    train_features = [];
    
    
    for i = 1: size(train_imagenames)
       filename =  strrep(train_imagenames(i),'.jpg','.mat');
       wordmap = load(strcat('../data/',filename{1}));
       wordmap = wordmap.wordMap;
       %Convert to histogram features using spatial pyramid matching.
       hist_feats = getImageFeaturesSPM(3,wordmap,size(dictionary,2));
       train_features = [train_features,hist_feats];
       
    end
   
    train_features= reshape(train_features,[] ,size(train_imagenames,1));
    train_labels = train_labels';

	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end