function P0=get_init_phase(Pu,Pv)
% P0=zeros(size(Pu));
% [ms,ns]=size(Pu);
% for m=0:ms/8-1
%     for n=0:ns/8-1
%         bm=m*8;
%         bn=n*8;
% P0(bm+1:bm+8,bn+1:bn+8) =getweight(Pu(bm+1:bm+8,bn+1:bn+8),Pv(bm+1:bm+8,bn+1:bn+8),8)  ;     
%     end
% end
 P0=(Pv+Pu)/2;

 
end