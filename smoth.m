function out=smoth(in,mb)
 h = fspecial('average',[mb,mb]);
 out=imfilter(in,h,'symmetric');
 
end