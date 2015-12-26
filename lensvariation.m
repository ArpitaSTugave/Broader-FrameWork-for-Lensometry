function img2=lensvariation( sfu1 , sfv1 ,img ,xl, yl,zl,m,n );
a = double(img);
p= 50;
fontSize = 16;
count= 0;
s=zeros(p,2);
uvlens=zeros(p,2);
for i = 1:50:m
    for j = 1:50:n
       if( sum(a(i, j, :)) < 500)  %if sun of (r+g+b) value of pixel at it is 1
            count = count+1;
s(count,:)=[ j , i];
k=  (zl * (s(count,:))');
uvnolens(count,:) =k + xl;
            end
    end
end
ulens=sfu1(uvnolens(:,1) ,uvnolens(:,2)); % u lens
vlens=sfv1(uvnolens(:,1) ,uvnolens(:,2)); % u lens
xm= padarray(xl,[0 (count-1)],'replicate','post');
s1=[ ulens, vlens ];
k =s1 - xm';
g = (k*yl);
ilens=g(:,1);
jlens=g(:,2);
inolens=s(:,1);
jnolens=s(:,2);
fitdata=[ilens inolens jlens jnolens];
dlmwrite('fitdata.txt',fitdata,'delimiter' ,'\t','precision',4);
img1=imadjust(img, [0 0.5], [0,1]);
img2=uint8(img1);
figure,imshow(img2);
hold on
ind=arrow3([inolens , jnolens],[ilens , jlens],'0.2',0.3,0.5,[],[],0.5);
hold off
%save as fig file to crop
savefig('arrows.fig');
% now chage it to jpg file to crop
figName='arrows.fig';
outName='arrows.jpg';
h=openfig(figName,'new','invisible');
saveas(h,outName,'jpg')
close(h);
img3=imread('arrows.jpg');
img4=imcrop(img3);
imshow(img4);
hold on
title('deflection image', 'FontSize', fontSize);
imwrite(img4,'arrowview.jpg');