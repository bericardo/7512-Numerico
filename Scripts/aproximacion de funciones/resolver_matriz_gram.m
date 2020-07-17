function v = resolver_matriz_gram(Q)
  A = crear_matriz_gram(Q);
  A_triangulada = triangular(A);
  v = sustitucion_inversa(A_triangulada);
endfunction