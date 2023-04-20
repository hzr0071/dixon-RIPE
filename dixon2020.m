function [W,F]=dixon2020(in_m,out_m,in_pp,out_pp,out_ang)

mb=30;
in=double(dicomread(in_m));
in=double(in);
out=double(dicomread(out_m));
out=double(out);

% figure(10);imshow([in,out],[]),title('in&out');
in_p=double(dicomread(in_pp));
in_p=(double(in_p)-2048)*pi/2048;
out_p=double(dicomread(out_pp));
out_p=(double(out_p)-2048)*pi/2048;
[sizem,sizen]=size(out);

J1=in;
%   J2=out.*exp((out_p-smoth(in_p,mb))*1i);
 J2=out.*exp((out_p-in_p)*1i);
M1=abs(in);
M2=abs(out);
ang=out_ang/180*pi;

t1=clock;

[S,B]=getSB(M1,M2,ang);
Pu=J2./(B+S.*exp(ang*1i));
Pv=J2./(S+B.*exp(ang*1i));

 Pu=Pu./abs(Pu);
 Pv=Pv./abs(Pv);
 for m=1:sizem
   for n=1:sizen
       if isnan(Pu(m,n))
           Pu(m,n)=0;
       end
       if isnan(Pv(m,n))
           Pv(m,n)=0;
       end
       
   end
end
P0=get_init_phase(Pu,Pv);



Pn=smoth(P0,mb);
for m=1:20
    Pn=get_new_phase(Pn,Pu,Pv);
    Pn=smoth(Pn,mb);
%     m
end
 
Ps=Pn./abs(Pn);
%  figure(m);imshow(angle(Ps)+2*pi,[]),title('phase');
Jc=J2./Ps;

A=[1,1;1,cos(ang);0,sin(ang)];
%A=((A'*A)\A');
A=((inv(A'*A))*A');
[m,n]=size(in);
J=zeros(3,1,m,n);
Xls=zeros(2,1,m,n);
W=zeros(m,n);
F=zeros(m,n);
for a=1:m
    for b=1:n
   J(:,:,a,b)=[J1(a,b),real(Jc(a,b)),imag(Jc(a,b))];
   Xls(:,:,a,b)=A*J(:,:,a,b);
   W(a,b)=Xls(1,1,a,b);
   F(a,b)=Xls(2,1,a,b);
    end
end
t2=clock;

etime(t2,t1)
% WW=imresize(abs(W),2,'bicubic');
%  figure(50);imshow(WW,[]),title('F');
  
end
