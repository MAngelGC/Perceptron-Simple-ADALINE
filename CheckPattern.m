function result = CheckPattern(Data,W)
    sz = size(Data); % Obtenemos el tamaño de los datos (dimensiones de la matriz)
    for i = 1:sz(1) % De las dimensiones, sacamos el número de filas
        [~,Output,Target] = ValoresIOT(Data,W,i); % Invocamos a ValoresIOT para obtener el Input, Output y Target
        if (max(Signo(Output), 0) ~= Target) % Si el Output obtenido por la neurona es distinto del que queremos obtener, devolvemos falso y salimos de la función
            result = false;
            return
        end
    end
    result = true; % En caso de que todos los outputs obtenidos sean los deseados, devolvemos true
end