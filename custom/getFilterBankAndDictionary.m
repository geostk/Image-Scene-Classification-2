function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

    filterBank  = createFilterBank();

    % TODO Implement your code here
    alpha = 100;
    K = 200;
    num_images = size(imPaths);
    filterResponsesVector = [];
    
    steps =  num_images(1);
    for i = 1:steps
        
        im = imread(imPaths{i});
        filterResponse = extractFilterResponses(im,filterBank);
        s = size(filterResponse);
        %Get the values at 'a' random pixels
        linear_vector = reshape(filterResponse,s(1)*s(2),s(3));
        %Pick 'a' random pixels using randperm
        linear_vector = linear_vector(randperm(s(1)*s(2),alpha),:);
        filterResponsesVector = cat(1,filterResponsesVector,linear_vector);
        
    end 
 
    [~, dictionary] = kmeans(filterResponsesVector, K, 'EmptyAction', 'drop');
    size(dictionary)

end
