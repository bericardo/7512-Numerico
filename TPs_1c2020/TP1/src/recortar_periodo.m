% Devuelve matriz con los datos de un periodo especifico
%
% datos - matriz que contiene los datos dia mes año y nivel hidrometrico
% desdeAnio - año de inicio del periodo
% hastaAñio - ultimo año del periodo
function resultado = recortar_periodo(datos,desdeAnio,hastaAnio)
  nuevosDatos = [];
  j = 1;
  
  for i=1:rows(datos)
    if ((datos(i,3) >= desdeAnio) && (datos(i,3) <= hastaAnio))
      nuevosDatos(j,:) = datos(i,:);
      j = j + 1;
    endif
  endfor
  
  resultado = nuevosDatos;
endfunction