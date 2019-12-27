function B = buzen(N,M,X)
   g = zeros(N+1,M);
   g(1,:) = 1; g(:,1) = 1;
   for n = 2:N+1
     for m = 2:M
       g(n,m) = g(n,m-1)+X(m)*g(n-1,m);
     endfor
   endfor
   B = g(N+1,M); 
endfunction
