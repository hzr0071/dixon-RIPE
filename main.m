%copyright by hzr0071%
[W,F]=dixon2020('in.dcm','out.dcm','in_p.dcm','out_p.dcm',185);
in=dicomread("in.dcm");
out=dicomread("out.dcm");



figure(50);imshow([in,out,W,F],[]),title('in&out&F&W');
