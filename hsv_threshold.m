function y=hsv_threshold(H,S,V,warna)
[m n]=size(H);
for i=1:m,
    for j=1:n,
        if warna=='k'
            if ((H(i,j)>=18 && H(i,j)<=45) && (S(i,j)>=148 && V(i,j)>=66))
                y(i,j)=255;
            else
                y(i,j)=0;
            end;
        end;
        if warna=='m'
            if ((H(i,j)>=240 || H(i,j)<=10) && (S(i,j)>=40 && V(i,j)>=30))
                y(i,j)=255;
            else
                y(i,j)=0;
            end;
        end;
        if warna=='b'
            if ((H(i,j)>120 && H(i,j)<=175) && (S(i,j)>=127.5 && V(i,j)>=20))
                y(i,j)=255;
            else
                y(i,j)=0;
            end;
        end;
    end;
end;
