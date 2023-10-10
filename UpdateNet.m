function result = UpdateNet(W,LR,Output,Target,Input)
    result = W + (LR*(Target - max(Signo(Output), 0))*Input)'; 
    %{
        Actualizamos los pesos de la siguiente forma
        1. Restamos la salida deseada a la obtenida por la neurona.
        2. Multiplicamos el resultado por la tasa de aprendizaje y por la entrada
        3. Trasponemos el resultado de la multiplicación para hacerlo coincidir con las dimensiones del vector de pesos
        4. Sumamos la traspuesta al vector de pesos y devolvemos el resultado.
    %}
end