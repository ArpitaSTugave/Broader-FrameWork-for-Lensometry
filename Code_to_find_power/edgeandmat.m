function [x z]=edgeandmat(a); 
lineparameters(1, :) = [88,93]; 
lineparameters(2, :) = [-32,1252];
lineparameters(3, :) = [28,2210];
lineparameters(4, :) = [88,1824];
lineparameters(5, :) = [-32,-466];
lineparameters(6, :) = [28,488];
for i = 1:6
    lineabc(i, 1) = cos((pi*lineparameters(i, 1))/180);
    lineabc(i, 2) = sin((pi*lineparameters(i, 1))/180);
    lineabc(i, 3) = lineparameters(i, 2);
end
A = lineabc(:, 1:2);
B = lineabc(:, 3);
for j = 1:5
    a1 = A(j,1);
    a2 = A(j,2);
    b1 = A(j+1, 1);
    b2 = A(j+1, 2);
    c1 = B(j);
    c2 = B(j+1);
    c(j,:) = [a1 a2; b1 b2]\[c1;c2]; %
end
c(6,:) = [A(6,1) A(6,2); A(1,1) A(1,2)]\[B(6);B(1)];


syms a cb ub b d vb                                       
x6=[1/(3) 1/sqrt(3)];
x1=[2/(3) 1/sqrt(3)];
x2=[5/(6) 1/(sqrt(3)*2)];
x3=[2/(3) 0];
x4=[1/(3) 0];
x5=[1/(6) 1/(sqrt(3)*2)];
f1=((x1(1)-(a*c(1,1)+cb*c(1,2)+ub))^2)+((x2(1)-(a*c(2,1)+cb*c(2,2)+ub))^2)+((x3(1)-(a*c(3,1)+cb*c(3,2)+ub))^2)+((x4(1)-(a*c(4,1)+cb*c(4,2)+ub))^2)+((x5(1)-(a*c(5,1)+cb*c(5,2)+ub))^2)+((x6(1)-(a*c(6,1)+cb*c(6,2)+ub))^2);
f2=((x1(2)-(b*c(1,1)+d*c(1,2)+vb))^2)+((x2(2)-(b*c(2,1)+d*c(2,2)+vb))^2)+((x3(2)-(b*c(3,1)+d*c(3,2)+vb))^2)+((x4(2)-(b*c(4,1)+d*c(4,2)+vb))^2)+((x5(2)-(b*c(5,1)+d*c(5,2)+vb))^2)+((x6(2)-(b*c(6,1)+d*c(6,2)+vb))^2);
f=f1+f2;
p=diff(f,a);
q=diff(f,cb);
r=diff(f,ub);
s=diff(f,b);
t=diff(f,d);
u=diff(f,vb);
[T,b] = equationsToMatrix(p,q,r,s,t,u,a,cb,ub,b,d,vb);
T=[T ,b];
R=rref(T);
R=double(R);
a=R(1,7)/R(1,1);
cb=R(2,7)/R(2,2);
ub=(R(3,7)/R(3,3));
b=R(4,7)/R(4,4);
d=R(5,7)/R(5,5);
vb=(R(6,7)/R(6,6));
x=[ub ; vb];                                  
z=[a cb ; b d];