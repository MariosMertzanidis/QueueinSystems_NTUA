function q = mean_clients(l, m);
     [p, dum] = intensities(l, m);
     q = p./(1-p);
     endfunction 