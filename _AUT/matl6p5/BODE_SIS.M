warning off
if ~(exist('num')) 
		clc;
 		fprintf('Il sistema non � stato inserito\n');
elseif isempty(find(num~=0)) | size(num,1)==0
		clc;
 		fprintf('Il sistema non � stato inserito\n');
else 
		grafico(1,0,num,den,T);
end;

