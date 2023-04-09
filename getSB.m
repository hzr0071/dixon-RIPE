function [S,B]=getSB(M1,M2,ang)
M3=sqrt((2*M2.^2-M1.^2*(1+cos(ang)))/(1-cos(ang)));
B=abs(M1+M3)/2;
S=abs(M1-M3)/2;
end