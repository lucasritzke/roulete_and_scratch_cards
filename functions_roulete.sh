#!/bin/bash 

#Esse arquivo contm quase todas as funçoes do script blaze.sh 

 

verifyINTV(){ 

if  echo "$value" | grep -Eq '^[0-9]+([.,][0-9]{0,2})?$'; then 

if echo "$value" | grep -q ','; then 

 

        value=$(echo $value | tr ',' '.') 

else 

        before="$value" 

        after="00" 

fi 

else 

        echo "Número Inválido" 

        exit 1 

fi 

} 

verifyINTW(){ 

        if  echo "$withdraw_" | grep -Eq '^[0-9]+([.,][0-9]{0,2})?$'; then 

if echo "$withdraw_" | grep -q ','; then 

 

        withdraw_=$(echo $withdraw_ | tr ',' '.') 

else 

        before="$withdraw_" 

        after="00" 

fi 

else 

        echo "Número Inválido" 

        exit 1 

fi 

} 

verifyINTD(){ 

        if  echo "$depo_value" | grep -Eq '^[0-9]+([.,][0-9]{0,2})?$'; then 

if echo "$depo_value" | grep -q ','; then 

 

        depo_value=$(echo $depo_value | tr ',' '.') 

else 

        before="$depo_value" 

        after="00" 

fi 

else 

        echo "Número Inválido" 

        exit 1 

fi 

} 

array1=("4-preto" "7-vermelho" "15-vermelho" "16-vermelho" "2-preto" "6-preto" "9-vermelho") 

array2=("9-preto" "7-preto" "2-vermelho" "12-preto" "8-preto" "19-vermelho" "10-preto") 

array3=("15-vermelho" "12-preto" "1-preto" "16-vermelho" "2-preto" "6-preto" "9-preto") 

array4=("9-vermelho" "18-preto" "2-vermelho" "9-preto" "8-preto" "19-vermelho" "10-vermelho") 

array5=("Raspando..." "Raspando..." "Raspando..." "Raspando..." "Raspando...") 
