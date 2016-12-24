function [sfu1 sfv1 u_delpoly v_delpoly power]=linetransformation( xl, zl , img ,sfr , sfg,m,n ,handles) 
adummy = double(img);
adummy = double(img);
fontSize = 16;
count = 0;
for i = 1:10:m
    for j = 1:10:n %ua nt checking for all pixel u check in steps f 5
        d= sum(adummy(i, j, :));
        if(d < 500)  %if sun of (r+g+b) value of pixel at it is 1
            count=count +1;
        end
    end
end
p=count;
count=0;
adummy1=zeros(p,3);
imp_data=zeros(p,2);
for i = 1:10:m
    for j = 1:10:n %ua nt checking for all pixel u check in steps f 5
        d= sum(adummy(i, j, :));
        if(d < 500)  %if sun of (r+g+b) value of pixel at it is 1
            count=count +1;
          adummy1(count,:) = adummy(i,j,:)./d;
           imp_data(count, 1) = j;
           imp_data(count, 2) = i;
        end
    end
end
s=imp_data';
Rseen=adummy1(:,1);
Gseen=adummy1(:,2);
k = zl * s;
x1= padarray(xl,[0 (count-1)],'replicate','post');
g = k + x1;
unolens=g(1,:)';
vnolens=g(2,:)';
Rshould=(sfr(Rseen,Gseen));
Gshould=(sfg(Rseen,Gseen));
ulens = (Rshould)+((Gshould.*(1/2)));  
vlens = (( Gshould.*(sqrt(3))/2)); 
sfu1 = fit([unolens vnolens], ulens,'poly11'); %for red ua plotiing rseen and gseen as x and y and rshould is z  with 55 x 55 mat
sfv1 = fit([unolens vnolens], vlens,'poly11'); %same for green
udeltal= sfu1(unolens, vnolens) - (unolens);
vdeltal= sfv1(unolens, vnolens) - (vnolens);
u_delpoly= fit([unolens vnolens],udeltal ,'poly11');
v_delpoly= fit([unolens vnolens],vdeltal ,'poly11');
power = confint(u_delpoly,0.95);
scale=-11.5454;
power=power(1,2)*scale;
power=num2str(power);
I = imread('imcircle.jpg');
   htxtins = vision.TextInserter(power);
    htxtins.Color = [255, 255, 255]; % [red, green, blue]
    htxtins.FontSize = 100;
    htxtins.Location = [1000 315]; % [x y]
    J = step(htxtins, I);
    imshow(J);
    hold on
    title('cropped circle with power', 'FontSize', fontSize);