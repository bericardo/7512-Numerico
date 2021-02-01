function resultado = euler(x,u,h,f)
  resultado = (u + h.*(f(x,u)));
endfunction