function [h] = getImageFeatures(wordMap, dictionarySize)
% Compute histogram of visual words
% Inputs:
% 	wordMap: WordMap matrix of size (h, w)
% 	dictionarySize: the number of visual words, dictionary size
% Output:
%   h: vector of histogram of visual words of size dictionarySize (l1-normalized, ie. sum(h(:)) == 1)

	% TODO Implement your code here
    
    h = histcounts(wordMap,1:201);
    h = h';
    h = h/sum(h(:));
    %h = (h - min(h))/(max(h) - min(h));
    %h = h / (wm_size(1)*wm_size(2));
	assert(numel(h) == dictionarySize);
end