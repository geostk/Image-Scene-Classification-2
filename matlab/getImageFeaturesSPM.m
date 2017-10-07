function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
%Calculate for layer 2
num_sub_images = 4^layerNum;

%% Layer 2
r = size(wordMap,1);
c = size(wordMap,2);
h = [];
h2 = mat2cell(wordMap,[round(r/4), round(r/4),round(r/4),r - 3*round(r/4)], [round(c/4),round(c/4),round(c/4),  c - 3*round(c/4)]);

for i = 1: 4
    for j = 1: 4
        h2{i,j} = getImageFeatures(h2{i,j},200);
        h = cat(2,h,h2{i,j});
    end
end
h2 = h;
%% Layer 1
h = [];

%Calculate for layer 1

h1 = cell(2,2);
h1{1,1} = h2(:,1) + h2(:,2) + h2(:,5) + h2(:,6); 
h1{1,2} = h2(:,3) + h2(:,4) + h2(:,7) + h2(:,8);
h1{2,1} = h2(:,9) + h2(:,10) + h2(:,13) + h2(:,14);
h1{2,2} = h2(:,11) + h2(:,12) + h2(:,15) + h2(:,16);
h = cat(2,h,h1{1,1},h1{1,2},h1{2,1},h1{2,2});
h1 = h;
%% Layer 0
h0 = h1(:,1) + h1(:,2) + h1(:,3) + h1(:,4);

h = cat(2,h2*0.5,h1*0.25,h0*0.25);
h = reshape(h,[],1);

h = h/sum(h(:));

end