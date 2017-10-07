function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here

img = double(img);

F = size(filterBank);

filterResponses = [];
M = size(img,1);
N = size(img,2);
F = F(1);

for i = 1:F
    
    
    fil = filterBank(i);
    fil = fil{1};
    %Check size of image 
    dim = size(size(img));
    dim_3 = dim(2);
    %Check if it's an RGB image
    if dim_3 == 3
        red = img(:,:,1);
        green = img(:,:,2);
        blue = img(:,:,3);

        
    %Grayscale.
    else
        red = img(:,:,1);
        green = img(:,:,1);
        blue = img(:,:,1);
     
        
    end
    
    %Now convert to LAB space
    [L,a,b] = RGB2Lab(red,green,blue);

    L = imfilter(L,fil);
    a = imfilter(a,fil);
    b = imfilter(b,fil);
    gather(L,a,b);
    %Concatenate each layer to make 3 layer image.
    filt_im = cat(3, L,a,b);
    
    filterResponses = cat(3,filterResponses,filt_im);
    
    
    
end

end
