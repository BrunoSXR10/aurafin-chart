#!/bin/bash

# Defina a URL do seu Load Balancer da AWS
URL="http://a0b34d14d8be5408991a98db1b6c11d0-a8e82326957cd349.elb.us-east-1.amazonaws.com/"

# Intervalo entre as chamadas em segundos
INTERVALO=1

echo "Iniciando monitoramento de $URL"
echo "Pressione [CTRL+C] para parar."
echo "--------------------------------------------------"

while true; do
    # Faz a requisição capturando apenas o código de status HTTP
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
    
    # Captura o horário atual para o log
    DATA_HORA=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Exibe o resultado com uma cor básica para destacar falhas (opcional)
    if [ "$STATUS" -eq 200 ]; then
        echo "[$DATA_HORA] Status: $STATUS - OK"
    else
        echo "[$DATA_HORA] Status: $STATUS - ATENÇÃO!"
    fi
    
    # Aguarda o tempo definido antes da próxima chamada
    sleep $INTERVALO
done
