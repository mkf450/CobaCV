load ('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Latih\negatif\fitur_negatif');
load ('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Latih\positif\fitur_positif');
options.MaxIter = 1000;
options.Display='iter';
jml_pos=size(feature_positif,1);
jml_neg=size(feature_negatif,1);
label_pos=ones(jml_pos,1)
label_neg=-1*label_pos;
data_x=[feature_positif;feature_negatif];
data_y=[label_pos;label_neg];
SVM_rambu1=svmtrain(data_x,data_y,'Options',options);
save 'D:\KULIAH\IF\COMP VISION\Latihan_CV\SVM_rambu1' SVM_rambu1