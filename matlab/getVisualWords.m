function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here

filterResponse = extractFilterResponses(img,filterBank);
wordMap = zeros( size(img,1),size(img,2) );  %This is the output 

num_filters = size(filterBank,1);
%visualWords = reshape(visualWords,[],num_filters*3);
out_size = size(wordMap);
dist_vec = [];

for i = 1:out_size(1)
    for j = 1:out_size(2)
         %Each pixel is a 60 dim vector
         pixel_vector = reshape(filterResponse(i,j,:),3*num_filters,1);
         dist_vec = pdist2(pixel_vector',dictionary');
         
         [index,val] = min(dist_vec);
         wordMap(i,j) = val;
         
    end
end
end
