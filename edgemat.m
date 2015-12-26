function [x, z]=edgemat(b,i,handles) 
I = rgb2gray(b);
fontSize = 16;

edges = edge(I, 'sobel');



[H, T, R] = hough(edges);

peaks = houghpeaks(H, 10,'Threshold', 0.3*max(H(:))); %if you take 0.5 6th lines is missed
lines = houghlines(edges, T, R, peaks, 'FillGap',50, 'MinLength', 200);
axes(handles); imshow(I); hold on
title('edges using hough transform', 'FontSize', fontSize);
max_len = 0;
for k = 1:length(lines)
  xy = [lines(k).point1; lines(k).point2];
  
  plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
  plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
  plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

end
switch i
    case 'cy5'
%for cy5
lineparameters(1, :) = [-32,1256];
lineparameters(2, :) = [28,2182];
lineparameters(3, :) = [88,1788];
lineparameters(4, :) = [-32,-461];
lineparameters(5, :) = [28,459];
%break;
%for cy4
   case 'cy4'
lineparameters(1, :) = [-32,1238];
lineparameters(2, :) = [28,2163];
lineparameters(3, :) = [88,1789];
lineparameters(4, :) = [-32,-480];
lineparameters(5, :) = [28,441];
%break;
    case 'cy3'
%for cy3
lineparameters(1, :) = [-32,1265];
lineparameters(2, :) = [28,2208];
lineparameters(3, :) = [88,1804];
lineparameters(4, :) = [-32,-451];
lineparameters(5, :) = [28,486];
%for cy2 take 12 points
%break;
    case 'cy2'
lineparameters(1, :) = [-32,1255];
lineparameters(2, :) = [28,2179];
lineparameters(3, :) = [88,1788];
lineparameters(4, :) = [-32,-462];
lineparameters(5, :) = [28,456];
%break;
    case 'cy1.25'
%for cy1.25 take 12 points
lineparameters(1, :) = [-32,1264];
lineparameters(2, :) = [28,2192];
lineparameters(3, :) = [88,1791];
lineparameters(4, :) = [-32,-453];
lineparameters(5, :) = [28,469];
%break;
    case 'cy0.5'
%for cy0.5
lineparameters(1, :) = [-32,1246];
lineparameters(2, :) = [28,2188];
lineparameters(3, :) = [88,1805];
lineparameters(4, :) = [-32,-471];
lineparameters(5, :) = [28,466];
%break;
    case 'cy_4'
%for cy_4
lineparameters(1, :) = [-32,1251];
lineparameters(2, :) = [28,2186];
lineparameters(3, :) = [88,1799];
lineparameters(4, :) = [-32,-467];
lineparameters(5, :) = [28,464];
%break;
    case 'cy_3'
%for cy_3
lineparameters(1, :) = [-31,1269];
lineparameters(2, :) = [28,2176];
lineparameters(3, :) = [88,1795];
lineparameters(4, :) = [-31,-449];
lineparameters(5, :) = [28,454];
%break;
    case 'cy_2'
%for cy_2
lineparameters(1, :) = [-32,1258];
lineparameters(2, :) = [28,2187];
lineparameters(3, :) = [88,1790];
lineparameters(4, :) = [-32,-458];
lineparameters(5, :) = [28,464];
%break;
    case 'cy_1'
%for cy_1
lineparameters(1, :) = [-31,1288];
lineparameters(2, :) = [28,2181];
lineparameters(3, :) = [88,1779];
lineparameters(4, :) = [-32,-453];
lineparameters(5, :) = [28,459];
%break;
    case 'cy_0.5'
%for cy_0.5
lineparameters(1, :) = [-32,1255];
lineparameters(2, :) = [28,2186];
lineparameters(3, :) = [88,1794];
lineparameters(4, :) = [-32,-462];
lineparameters(5, :) = [28,464];
%break;
    case 'cir0.5'
%for cir0.5 
lineparameters(1, :) = [-32,1253];
lineparameters(2, :) = [28,2182];
lineparameters(3, :) = [88,1792];
lineparameters(4, :) = [-32,-464];
lineparameters(5, :) = [28,459];
%break;
    case 'cir_0.5'
%for cir_0.5 
lineparameters(1, :) = [-32,1257];
lineparameters(2, :) = [28,2179];
lineparameters(3, :) = [88,1785];
lineparameters(4, :) = [-32,-460];
lineparameters(5, :) = [28,457];
%break;
    case 'cir_1'
%for cir_1
lineparameters(1, :) = [-32,1242];
lineparameters(2, :) = [28,2182];
lineparameters(3, :) = [88,1801];
lineparameters(4, :) = [-32,-474];
lineparameters(5, :) = [28,459];
%break;
    case 'cir_1.5'
%for cir_1.5
lineparameters(1, :) = [-32,1252];
lineparameters(2, :) = [28,2188];
lineparameters(3, :) = [88,1800];
lineparameters(4, :) = [-32,-466];
lineparameters(5, :) = [28,466];
%break;
    case 'cir_2'
%for cir_2
lineparameters(1, :) = [-32,1258];
lineparameters(2, :) = [28,2183];
lineparameters(3, :) = [88,1788];
lineparameters(4, :) = [-32,-459];
lineparameters(5, :) = [28,460];
%break;
    case 'cir_2.5'
%for cir_2.5
lineparameters(1, :) = [-32,1195];
lineparameters(2, :) = [28,2185];
lineparameters(3, :) = [88,1796];
lineparameters(4, :) = [-31,-441];
lineparameters(5, :) = [28,463];
%break;
    case 'cir_3'
%for cir_3
lineparameters(1, :) = [-32,1243];
lineparameters(2, :) = [28,2180];
lineparameters(3, :) = [88,1801];
lineparameters(4, :) = [-31,-474];
lineparameters(5, :) = [28,458];
%break;
    case 'cir_3.5'
%for cir_3.5
lineparameters(1, :) = [-32,1256];
lineparameters(2, :) = [28,2190];
lineparameters(3, :) = [88,1797];
lineparameters(4, :) = [-32,-460];
lineparameters(5, :) = [28,467];
%break;
    case 'cir_4'
%for cir_4
lineparameters(1, :) = [-32,1255];
lineparameters(2, :) = [28,2191];
lineparameters(3, :) = [88,1803];
lineparameters(4, :) = [-32,-461];
lineparameters(5, :) = [28,469];
%break;
    case 'cir_4.5'
%for cir_4.5
lineparameters(1, :) = [-32,1251];
lineparameters(2, :) = [28,2205];
lineparameters(3, :) = [88,1816];
lineparameters(4, :) = [-32,-466];
lineparameters(5, :) = [28,483];
%break;
    case 'cir_5'
%for cir_5
lineparameters(1, :) = [-32,1257];
lineparameters(2, :) = [28,2187];
lineparameters(3, :) = [88,1795];
lineparameters(4, :) = [-32,-460];
lineparameters(5, :) = [28,465];
%break;
    case 'cir_5.5'
%for cir_5.5
lineparameters(1, :) = [-32,1257];
lineparameters(2, :) = [28,2199];
lineparameters(3, :) = [88,1804];
lineparameters(4, :) = [-32,-454];
lineparameters(5, :) = [28,477];
%break;
    case 'cir_7'
%for cir_7
lineparameters(1, :) = [-32,1258];
lineparameters(2, :) = [28,2199];
lineparameters(3, :) = [88,1804];
lineparameters(4, :) = [-32,-459];
lineparameters(5, :) = [28,477];
%break;
    case 'cir_8'
%for cir_8
lineparameters(1, :) = [-32,1244];
lineparameters(2, :) = [28,2203];
lineparameters(3, :) = [88,1823];
lineparameters(4, :) = [-31,-452];
lineparameters(5, :) = [28,481];
%break;
    case 'cir_9'
%for cir_9
lineparameters(1, :) = [-32,1242];
lineparameters(2, :) = [28,2186];
lineparameters(3, :) = [88,1808];
lineparameters(4, :) = [-32,-475];
lineparameters(5, :) = [28,464];
%break;
    case 'cir_10'
%for cir_10
lineparameters(1, :) = [-32,1253];
lineparameters(2, :) = [28,2188];
lineparameters(3, :) = [88,1799];
lineparameters(4, :) = [-32,-466];
lineparameters(5, :) = [28,466];
%break;
    case 'cir_11'
%for cir_11
lineparameters(1, :) = [-32,1253];
lineparameters(2, :) = [28,2173];
lineparameters(3, :) = [88,1785];
lineparameters(4, :) = [-32,-465];
lineparameters(5, :) = [28,451];
%break;
    case 'cir_12'
%for cir_12
lineparameters(1, :) = [-32,1267];
lineparameters(2, :) = [28,2189];
lineparameters(3, :) = [88,1786];
lineparameters(4, :) = [-32,-450];
lineparameters(5, :) = [28,467];
%break;
    case 'cir1'
%for cir1
lineparameters(1, :) = [-32,1253];
lineparameters(2, :) = [28,2191];
lineparameters(3, :) = [88,1801];
lineparameters(4, :) = [-32,-464];
lineparameters(5, :) = [28,469];
%break;
    case 'cir1.25'
%for cir1.25
lineparameters(1, :) = [-32,1248];
lineparameters(2, :) = [28,2193];
lineparameters(3, :) = [88,1809];
lineparameters(4, :) = [-32,-469];
lineparameters(5, :) = [28,471];
%break;
    case 'cir1.5'
%for cir1.5
lineparameters(1, :) = [-32,1244];
lineparameters(2, :) = [28,2185];
lineparameters(3, :) = [88,1804];
lineparameters(4, :) = [-32,-473];
lineparameters(5, :) = [28,463];
%break;
    case 'cir2'
%for cir2
lineparameters(1, :) = [-32,1256];
lineparameters(2, :) = [28,2195];
lineparameters(3, :) = [88,1801];
lineparameters(4, :) = [-32,-460];
lineparameters(5, :) = [28,473];
%break;
    case 'cir3'
%for cir3
lineparameters(1, :) = [-32,1264];
lineparameters(2, :) = [28,2193];
lineparameters(3, :) = [88,1793];
lineparameters(4, :) = [-32,-453];
lineparameters(5, :) = [28,471];
%break;
    case 'cir3.5'
%for cir3.5
lineparameters(1, :) = [-32,1260];
lineparameters(2, :) = [28,2201];
lineparameters(3, :) = [88,1807];
lineparameters(4, :) = [-32,-457];
lineparameters(5, :) = [28,479];
%break;
    case 'cir4'
%for cir4
lineparameters(1, :) = [-32,1253];
lineparameters(2, :) = [28,2194];
lineparameters(3, :) = [88,1803];
lineparameters(4, :) = [-32,-464];
lineparameters(5, :) = [28,472];
%break;
    case 'cir4.5'
%for cir4.5
lineparameters(1, :) = [-32,1258];
lineparameters(2, :) = [28,2201];
lineparameters(3, :) = [88,1806];
lineparameters(4, :) = [-32,-458];
lineparameters(5, :) = [28,479];
%break;
case 'cir5'
%for cir5
lineparameters(1, :) = [-32,1247];
lineparameters(2, :) = [28,2209];
lineparameters(3, :) = [88,1826];
lineparameters(4, :) = [-32,-471];
lineparameters(5, :) = [28,487];
%break;
case 'cir5.5'
%for cir5.5
lineparameters(1, :) = [-32,1249];
lineparameters(2, :) = [28,2192];
lineparameters(3, :) = [88,1806];
lineparameters(4, :) = [-32,-467];
lineparameters(5, :) = [28,470];
case 'cir6'
%for cir6
lineparameters(1, :) = [-32,1264];
lineparameters(2, :) = [28,2198];
lineparameters(3, :) = [88,1797];
lineparameters(4, :) = [-32,-453];
lineparameters(5, :) = [28,476];
case 'cir7'
%for cir7
lineparameters(1, :) = [-32,1256];
lineparameters(2, :) = [28,2189];
lineparameters(3, :) = [88,1797];
lineparameters(4, :) = [-32,-462];
lineparameters(5, :) = [28,467];
case 'cir8'
%for cir8
lineparameters(1, :) = [-32,1254];
lineparameters(2, :) = [28,2199];
lineparameters(3, :) = [88,1809];
lineparameters(4, :) = [-32,-464];
lineparameters(5, :) = [28,477];
case 'cir9'
%for cir9
lineparameters(1, :) = [-32,1267];
lineparameters(2, :) = [28,2195];
lineparameters(3, :) = [88,1791];
lineparameters(4, :) = [-32,-450];
lineparameters(5, :) = [28,473];
case 'cir10'
%for cir10
lineparameters(1, :) = [-32,1251];
lineparameters(2, :) = [28,2187];
lineparameters(3, :) = [88,1798];
lineparameters(4, :) = [-32,-466];
lineparameters(5, :) = [28,465];
case 'cir11'
%for cir11
lineparameters(1, :) = [-32,1249];
lineparameters(2, :) = [28,2199];
lineparameters(3, :) = [88,1813];
lineparameters(4, :) = [-32,-468];
lineparameters(5, :) = [28,477];
case 'cir12'
%for cir12
lineparameters(1, :) = [-32,1254];
lineparameters(2, :) = [28,2181];
lineparameters(3, :) = [88,1790];
lineparameters(4, :) = [-32,-462];
lineparameters(5, :) = [28,459];
    otherwise 
        warning('image does not exists ');
end
for i = 1:5
    lineabc(i, 1) = cos((pi*lineparameters(i, 1))/180);
    lineabc(i, 2) = sin((pi*lineparameters(i, 1))/180);
    lineabc(i, 3) = lineparameters(i, 2);
end
A = lineabc(:, 1:2);
B = lineabc(:, 3);
for j = 1:4
    a1 = A(j,1);
    a2 = A(j,2);
    b1 = A(j+1, 1);
    b2 = A(j+1, 2);
    c1 = B(j);
    c2 = B(j+1);
    c(j,:) = [a1 a2; b1 b2]\[c1;c2];
end
c(5,:) = [A(5,1) A(5,2); A(1,1) A(1,2)]\[B(5);B(1)];
syms a cb ub b d vb 
x1=[5/(6) 1/(2*(sqrt(3)))];
x2=[2/(3) 0];
x3=[1/(3) 0];
x4=[1/(6) 1/(2*(sqrt(3)))];
f1=((x1(1)-(a*c(1,1)+cb*c(1,2)+ub))^2)+((x2(1)-(a*c(2,1)+cb*c(2,2)+ub))^2)+((x3(1)-(a*c(3,1)+cb*c(3,2)+ub))^2)+((x4(1)-(a*c(4,1)+cb*c(4,2)+ub))^2);
f2=((x1(2)-(b*c(1,1)+d*c(1,2)+vb))^2)+((x2(2)-(b*c(2,1)+d*c(2,2)+vb))^2)+((x3(2)-(b*c(3,1)+d*c(3,2)+vb))^2)+((x4(2)-(b*c(4,1)+d*c(4,2)+vb))^2);
f=f1+f2;
p=diff(f,a);
q=diff(f,cb);
r=diff(f,ub);
s=diff(f,b);
t=diff(f,d);
u=diff(f,vb);
[T,b] = equationsToMatrix(p,q,r,s,t,u,a,cb,ub,b,d,vb);
T=[T ,b];
T=double(T) ;
R=rref(T);
R=double(R) ;
a=R(1,7)/R(1,1) ; 
cb=R(2,7)/R(2,2) ;
ub=(R(3,7)/R(3,3)) ;
b=R(4,7)/R(4,4) ;
d=R(5,7)/R(5,5) ;
vb=(R(6,7)/R(6,6)) ;
x=[ub ; vb];
z=[a cb ; b d];
