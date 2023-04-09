function NPn=get_new_phase(Pn,Pu,Pv)
% [m,n]=size(Pn);
% NPn=zeros([m,n]);
P1=abs((Pu)-(Pn));
P2=abs((Pv)-(Pn));
% for a=1:m
%     for b=1:n
%     if P1(a,b)<P2(a,b)
%         NPn(a,b)=Pu(a,b);
%     
%     else, if P1(a,b)>P2(a,b)
%         NPn(a,b)=Pv(a,b);
%          end
%    end
% %     if P1(a,b)==P2(a,b)
% %         NPn(a,b)=0;
% %     end
%     end
% end
mask=sign(P1-P2);
tmp=ones(size(mask));
mask1=(mask+tmp)/2;
mask2=(-mask+tmp)/2;
NPn=mask1.*Pv+mask2.*Pu;


end