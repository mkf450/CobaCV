clear;clc;
%% Mengambi data yang akan di Uji
load ('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Uji\negatif\fitur_uji_negatif');
load ('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Uji\positif\fitur_uji_positif');
load ('D:\KULIAH\IF\COMP VISION\Latihan_CV\Data Uji\SVM_rambu1.mat');
%% Data Pengujian
uji_pos=feature_uji_positif;
uji_neg=feature_uji_negatif;
m=size(uji_pos,1)
n=size(uji_neg,1)
label_1=ones(m,1);
label_2=-1*ones(n,1);
result1=[];result2=[];
%% Proses Pengujian
for i=1:m
   result11 = svmclassify(SVM_rambu1, uji_pos(i,:));
   result1=[result1; result11];
end
for i=1:n
    result12 = svmclassify(SVM_rambu1, uji_neg(i,:));
    result2=[result2; result12]
end
result=[result1; result2];hasil=[label_1;label_2];
matriks=[hasil result]
m=size(matriks,1);
tp=0;tn=0;fp=0;fn=0;
%% Evaluasi Hasil Pengujian
for i=1:m
    if matriks(i,1)==1 && matriks(i,2)==1
        tp=tp+1;
    end
    if matriks(i,1)==1 && matriks(i,2)==-1
        fn=fn+1;
    end
    if matriks(i,1)==-1 && matriks(i,2)==-1
        tn=tn+1;
    end
    if matriks(i,1)==-1 && matriks(i,2)==1
        fp=fp+1;
    end
end
true_positif=tp
true_negatif=tn
false_positif=fp
false_negatif=fn
akurasi=((tp+tn)/(tp+tn+fp+fn))*100
precission = (tp/(tp+fp))*100
recall = (tp/(tp+fn))*100
