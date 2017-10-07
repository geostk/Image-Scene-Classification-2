% Computes filter bank and dictionary, and saves it in dictionary.mat 

function computeDictionary()

	load('../data/traintest.mat'); 

	interval= 1;
    %%
    %%
    %% CHANGE THIS PART OF THE CODE TO CONVERT TO OLD SIZES
	%%train_imagenames = train_imagenames(1:interval:end);
    train_imagenames = train_imagenames(1:interval:end);
    %%
    
    
	[filterBank,dictionary] = getFilterBankAndDictionary(strcat(['../data/'],train_imagenames));
    %%Transposing dictionary
    dictionary = dictionary';
	save('dictionary.mat','filterBank','dictionary'); 

end
