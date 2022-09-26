nfiles=dir('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Latih\negatif\*.jpg');
n=max(size(nfiles));
feature_negatif=[];
for i=1:n
    currentfilename = nfiles(i).name;
    images{i} = imread(fullfile('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Latih\negatif\',currentfilename));
    images{i} = rgb2gray(images{i});
    images{i} = imresize(images{i},[128 128]);
    feature{i}=hog_feature_vector(images{i});
    feature_negatif=[feature_negatif; feature{i}];
end

nfiles=dir('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Latih\positif\*.jpg');
n=max(size(nfiles));
feature_positif=[];
for i=1:n
    currentfilename = nfiles(i).name;
    images{i} = imread(fullfile('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data latih\positif\',currentfilename));
    images{i} = rgb2gray(images{i});
    images{i} = imresize(images{i},[128 128]);
    feature{i}=hog_feature_vector(images{i});
    feature_positif=[feature_positif; feature{i}];
end

nfiles=dir('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Uji\positif\*.jpg')
n=max(size(nfiles))
feature_uji_positif=[];
for i=1:n
    currentfilename = nfiles(i).name;
    images{i} = imread(fullfile('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Uji\positif\',currentfilename));
    images{i} = rgb2gray(images{i});
    images{i} = imresize(images{i},[128 128]);
    feature{i}=hog_feature_vector(images{i});
    feature_uji_positif=[feature_uji_positif; feature{i}];
end

nfiles=dir('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Uji\negatif\*.jpg');
n=max(size(nfiles));
feature_uji_negatif=[];
for i=1:n
    currentfilename = nfiles(i).name;
    images{i} = imread(fullfile('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Uji\negatif\',currentfilename));
    images{i} = rgb2gray(images{i});
    images{i} = imresize(images{i},[128 128]);
    feature{i}=hog_feature_vector(images{i});
    feature_uji_negatif=[feature_uji_negatif; feature{i}];
end


save 'D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Latih\negatif\fitur_negatif' feature_negatif;
save 'D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Latih\positif\fitur_positif' feature_positif;
save 'D:\KULIAH\IF\COMP VISION\Latihan_CV\Data uji\negatif\fitur_uji_negatif' feature_uji_negatif;
save 'D:\KULIAH\IF\COMP VISION\Latihan_CV\Data uji\positif\fitur_uji_positif' feature_uji_positif;

