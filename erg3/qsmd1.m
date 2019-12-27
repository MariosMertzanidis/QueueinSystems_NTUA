function [U,R,Q,X]=qsmd1(l,m)
	U=l./m;
	R=1./m+0.5.*(U./(m-l));
	Q= U+0.5.*(U.^2./(1-U));
	X=l;
endfunction
