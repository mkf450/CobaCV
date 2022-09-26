clear;
load SVM_rambu1.mat;
%x=imread('D:\KULIAH\IF\COMP VISION\Latihan_CV\tol-smg-sltg_10_3816.jpg');
x=imread('D:\KULIAH\IF\COMP VISION\Latihan_CV\tol-smg-sltg_10_3816.jpg');
[H,S,V]=rgb2hsv(x);
 HSV(:,:,1)=H;HSV(:,:,2)=S;HSV(:,:,3)=V;
 Hn=H*360;
 Sn=S*255;
 Vn=V*255;
 hsl_m=hsv_threshold(Hn,Sn,Vn,'m');
 hsl_b=hsv_threshold(Hn,Sn,Vn,'b');
 hsl_k=hsv_threshold(Hn,Sn,Vn,'k');
 hsl=hsl_m+hsl_b+hsl_k; 
BW=im2bw(hsl);
C=imfill(BW,8,'holes');
C=double(C);
S=strel('disk',5);
C3=imerode(C,S);
C3=imdilate(C3,S);
figure(1)
imshow(x);
figure(2)
imshow(HSV);
figure(3)
imshow(BW);
figure(4)
imshow(C);
figure(5)
imshow(C3)

[L,jml]=bwlabel(C3,8);
figure(6)
imshow(x);
% hold on;
rectangle('Position',[800,1,1000,1],'EdgeColor','y','LineWidth',2);
blok=regionprops(L,'all')
A=[];
for i=1:length(blok)
    A=[A blok(i).BoundingBox];
end;
A1=reshape(A,4,max(size(A))/4);
AA=A1';
for i=1:size(AA,1)
    AA(i,1)=AA(i,1)-10;
    AA(i,2)=AA(i,2)-10;
    AA(i,3)=AA(i,3)+10;
    AA(i,4)=AA(i,4)+10;
end;
%AAA=reshape(AA,1,size(AA,1)*size(AA,2));
%for i=1:length(blok)
%    HH{i}=imresize(imcrop(x,[AA(i,1:4)]),[128 128]);
%    HH{i}=rgb2gray(HH{i});
%    HH{i}=edge(HH{i},'canny');
%    f{i}=hog_feature_vector(HH{i});
%    hasil(i)=deteksi_rambu(f{i});
%end;

for i=1:length(blok)
   % if hasil(i)==1
   if (AA(i,3)>=50 && AA(i,3)<=150)&& (AA(i,4)>=50 && AA(i,4)<=150)
    rectangle('Position',AA(i,1:4),'EdgeColor','y','LineWidth',2);
    %end;
   end
end;
figure(7)
imshow(x);
hold on;
for i=1:length(blok)
   if (AA(i,3)>=20 && AA(i,3)<=150)&& (AA(i,4)>=20 && AA(i,4)<=150)
       GB{i}=rgb2gray(imresize(imcrop(x,[AA(i,1:4)]),[128 128]));
       f{i}=hog_feature_vector(GB{i});
       if svmclassify(SVM_rambu1,f{i})==1 
         rectangle('Position',AA(i,1:4),'EdgeColor','y','LineWidth',2);
       end;
   end
end;

hold off;
