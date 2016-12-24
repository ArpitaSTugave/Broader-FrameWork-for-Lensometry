function img=cropcircle(I,i,handles);
imageSize = size(I);
[m,n,three]=size(I);

switch i 
    case 'cy5'
x0=605;y0=1175;
%break;
    case 'cy4'
x0=605;y0=1158;
%break;
    case 'cy3'
x0=619;y0=1184;
%break;
    case 'cy2'
x0=604;y0=1169;
%break;
    case 'cy1.25'
x0=613;y0=1180;
%break;
    case 'cy0.5'
x0=620;y0=1168;
%break;
  case 'cy_4'
x0=620;y0=1163;
%break;
  case 'cy_3'
x0=607;y0=1157;
%break;
  case 'cy_2'
x0=601;y0=1174;
%break;
  case 'cy_1'
x0=595;y0=1177;
%break;
  case 'cy_0.5'
x0=613;y0=1172;
%break;
  case 'cir12'
x0=617;y0=1181;
%break;
  case 'cir11'
x0=634;y0=1184;
%break;
  case 'cir10'
x0=617;y0=1180;
%break;
  case 'cir9'
x0=610;y0=1195;
%break;
  case 'cir8'
x0=631;y0=1189;
%break;
  case 'cir7'
x0=616;y0=1186;
%break;
case 'cir6'
x0=623;y0=1192;
%break;
case 'cir5.5'
x0=622;y0=1183;
%break;
case 'cir5'
x0=644;y0=1180;
%break;
case 'cir4.5'
x0=623;y0=1184;
%break;
case 'cir4'
x0=623;y0=1178;
%break;
case 'cir3.5'
x0=629;y0=1181;
%break;
case 'cir3'
x0=611;y0=1181;
%break;
case 'cir2'
x0=623;y0=1175;
%break;
case 'cir1.5'
x0=623;y0=1169;
%break;
case 'cir1.25'
x0=641;y0=1178;
%break;
case 'cir1'
x0=620;y0=1177;
%break;
case 'cir0.5'
x0=611;y0=1163;
%break;
case 'cir_0.5'
x0=613;y0=1166;
%break;
case 'cir_1'
x0=617;y0=1165;
%break;
case 'cir_1.5'
x0=616;y0=1174;
%break;
case 'cir_2'
x0=607;y0=1166;
%break;
case 'cir_2.5'
x0=619;y0=1168;
%break;
case 'cir_3'
x0=623;y0=1162;
%break;
case 'cir_3.5'
x0=619;y0=1177;
%break;
case 'cir_4'
x0=617;y0=1181;
%break;
case 'cir_4.5'
x0=638;y0=1177;
%break;
case 'cir_5'
x0=613;y0=1169;
%break;
case 'cir_5.5'
x0=616;y0=1183;
%break;
case 'cir_7'
x0=622;y0=1178;
%break;
case 'cir_8'
x0=644;y0=1174;
%break;
case 'cir_9'
x0=622;y0=1163;
%break;
case 'cir_10'
x0=616;y0=1174;
%break;
case 'cir_11'
x0=602;y0=1160;
%break;
case 'cir_12'
x0=605;y0=1181;
%break;
  otherwise 
        warning('image does not exists ');
end
ci = [x0,y0, 200];
[xx,yy] = ndgrid((1:imageSize(1))-ci(1),(1:imageSize(2))-ci(2));
mask = uint8((xx.^2 + yy.^2)<ci(3)^2);
croppedImage = uint8(zeros(size(I)));
croppedImage(:,:,1) = I(:,:,1).*mask;
croppedImage(:,:,2) = I(:,:,2).*mask;
croppedImage(:,:,3) = I(:,:,3).*mask;
imwrite(croppedImage,'imcircle.jpg');
img=croppedImage;
img1=imcomplement(img);
bw2=im2bw(img1,graythresh(img1));
bw(:,:,1)=bw2;
bw(:,:,2)=bw2;
bw(:,:,3)=bw2;
bw3=im2uint8(bw);
img=bw3 + img;
imshow(img);
hold on
title('cropped circle', 'FontSize', 16);