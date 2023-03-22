#!/bin/bash 

# 

clear 

echo -e "\n~~~ Bem Vindo a Roleta ~~~\n" 

echo -e "\n\nQual o saldo da sua carteira para adicionarmos fundos na carteira\n\n" 

read balance 

source /home/vagrant/lritzke/bin/script/funçoes_roleta.sh 

if   

if echo "$balance" | grep -q ','; then 

 

        balance=$(echo $balance | tr ',' '.') 

else 

        before="$balance" 

        after="00" 

fi 

else 

        echo -e "\n\nNúmero Inválido\n\n" 

        sleep 2 

        exec "/home/vagrant/lritzke/bin/script/roleta.sh" 

fi 

MENU_PRINC() { 

        if [[ $1 ]] 

        then 

                echo -e "\n$1" 

        fi 

        echo -e "\n1. Jogar roulette game \n2. Jogar Raspadinha \n3. Ver Saldo \n4. Realizar deposito\n5. Sacar Dinheiro\n 6. Sair" 

        read SELECT_MP 

 

        case $SELECT_MP in 

                1) start_roulette ;; 

                2) scratch_card ;; 

                3) see_balance ;; 

                4) deposit ;; 

                5) withdraw ;; 

                6) leave ;; 

                *) MENU_PRINC 

        esac 

} 

start_roulette(){ 

        echo -e "\nQual o valor deseja depositar na roleta para dobrar\nSeu saldo é de R\$:$balance" 

        read value 

        verifyINTV 

        if (( $(echo "$value > $balance" | bc -l) )); then 

                echo -e "Você não tem o R\$:$value para jogar na roleta \nSeu saldo é de $balance\n\nVocê voltará ao menu principal" 

                MENU_PRINC 

 

        elif (( $(echo "$value <= $balance" | bc -l) )); then 

                echo -e "\nQual a cor que você deseja apostar se for preto tecle (1) se for vermelho tecle (2)" 

                read color 

                clear 

                if [ $color -eq 1 ]; then 

                        echo -e "Você apostou R\$ $value na cor preta" 

                elif [ $color -eq 2 ]; then 

                        echo -e "Você apostou R\$ $value na cor vermelha" 

                else 

                        echo -e "Você DIGITOU ALGO ERRADO!!\nInicie novamente" 

                        start_roulette 

                fi 

                echo -e "\nAguardando mais jogadores...\n" 

                sleep 3 

                clear 

                echo -e "\nA roleta ira começar...\n" 

                sleep 2 

                clear 

                num_random=$(($RANDOM%4)) 

                if [ $num_random == "1" ]; then 

 

                for i in ${array1[@]} 

                do 

                        echo "Rodando $i" 

                        sleep 1 

                done 

                        if [ $color -eq "2" ]; then 

                                balance=$(echo "$balance-$value" | bc) 

                                value=$(echo "$value*2" | bc) 

                                balance=$(echo "$balance+$value" | bc) 

                                echo "Você ganhou!!" 

                                echo "Seu saldo é de $balance" 

                        else 

                                balance=$(echo "$balance-$value" | bc) 

                                echo -e "Você perdeu\nSeu saldo é de R\$ $balance" 

                        fi 

                elif [ $num_random == "2" ]; then 

 

                for i in ${array2[@]} 

                do 

                        echo "Rodando $i" 

                        sleep 1 

                done 

                        if [ $color -eq "1" ]; then 

                                balance=$(echo "$balance-$value" | bc) 

                                value=$(echo "$value*2" | bc) 

                                balance=$(echo "$balance+$value" | bc) 

                                echo "Você ganhou!!" 

                                echo "Seu saldo é de $balance" 

                        else 

                                balance=$(echo "$balance-$value" | bc) 

                                echo -e "Você perdeu\nSeu saldo é de R\$ $balance" 

                        fi 

                elif [ $num_random == "3" ]; then 

 

                for i in ${array3[@]} 

                do 

                        echo "Rodando $i" 

                        sleep 1 

                done 

                        if [ $color -eq "1" ]; then 

                                balance=$(echo "$balance-$value" | bc) 

                                value=$(echo "$value*2" | bc) 

                                balance=$(echo "$balance+$value" | bc) 

                                echo "Você ganhou!!" 

                                echo "Seu saldo é de $balance" 

                        else 

                                balance=$(echo "$balance-$value" | bc) 

                                echo -e "Você perdeu\nSeu saldo é de R\$ $balance" 

                        fi 

                elif [ $num_random == "4" ]; then 

 

                for i in ${array4[@]} 

                do 

                        echo "Rodando $i" 

                        sleep 1 

                done 

                        if [ $color -eq "2" ]; then 

                                balance=$(echo "$balance-$value" | bc) 

                                value=$(echo "$value*2" | bc) 

                                balance=$(echo "$balance+$value" | bc) 

                                echo "Você ganhou!!" 

                                echo "Seu saldo é de $balance" 

                        else 

                                balance=$(echo "$balance-$value" | bc) 

                                echo -e "Você perdeu\nSeu saldo é de R\$ $balance" 

                        fi 

                fi 

        fi 

        sleep 4 

clear 

MENU_PRINC 

} 

scratch_card() { 

        if (( $(echo "$balance < 100" | bc -l) )); then 

                echo -e "Você não tem dinheiro suficiente para raspar um bilhete" 

        elif (( $(echo "$balance >= 100" | bc -l) )); then 

                echo -e "Você deseja raspar um bilhete por R\$: 100\nSe sim tecle (1) se não tecle (2)\n" 

                read scratch 

                if [ $scratch -eq "1" ]; then 

                        clear 

                        balance=$(echo "$balance-100" | bc) 

 

                        echo -e "Seu saldo é de $balance\n\nVocê adquiriu um bilhete por R\$ 100\n\nEstamos procurando uma moeda para raspar aguarde...\n" 

                        sleep 3 

                        num_random_s=$((RANDOM%4)) 

                        if [ $num_random_s -eq "1" ]; then 

                                for i in ${array5[@]} 

                                do 

                                        echo "$i" 

                                sleep 2 

                                done 

                                echo "Você infelismente não ganhou nada" 

                        elif [ $num_random_s -eq "2" ]; then 

                                for i in ${array5[@]} 

                                do 

                                        echo "$i" 

                                sleep 2 

                                done 

                                balance=$(echo "$balance+700" | bc) 

                                echo -e "Você ganhou 700 reais\nSeu saldo é de R\$ $balance" 

                        elif [ $num_random_s -eq "3" ]; then 

                                for i in ${array5[@]} 

                                do 

                                        echo "$i" 

                                sleep 2 

                                done 

                                balance=$(echo "$balance+200" | bc) 

                                echo -e "Você ganhou 200 reais\nSeu saldo é de R\$ $balance" 

                        elif [ $num_random_s -eq "4" ]; then 

                                for i in ${array5[@]} 

                                do 

                                        echo "$i" 

                                sleep 2 

                                done 

                                echo "Você infelismente não ganhou nada" 

                        else 

                                echo -e "algo deu errado\nSeu programa está reiniciando..." 

                                sleep 3 

                                exec "/home/lritzke/bin/scripts/blaze.sh" 

                        fi 

 

                elif [ $scratch -eq "2" ]; then 

                        echo -e "\nVocê voltará para o menu principal!!\n" 

                        MENU_PRINC 

                else 

                        echo -e "Algo deu errado\nSeu programa está reiniciando..." 

                        sleep 3 

                        exec "/home/lritzke/bin/blaze.sh" 

                fi 

        else 

                echo -e "Algo deu errado\nSeu programa está reiniciando..." 

                sleep 3 

                exec "/home/lritzke/bin/blaze.sh" 

        fi 

MENU_PRINC 

} 

withdraw() { 

        echo -e "Qual o valor que deseja sacar?\nSeu saldo é de $balance." 

        read withdraw_ 

        verifyINTW 

        if (( $(echo "$balance >= $withdraw_" | bc -l) )) 

        then 

                echo "Enviando..." 

                sleep 3 

                clear 

                echo -e "Seu saldo era de R\$ $balance" 

                balance=$(echo "$balance-$withdraw_" | bc) 

                echo -e "E agora é de R\$ $balance\nVocê voltará ao menu principal" 

                MENU_PRINC 

 

        elif (( $(echo "$balance < $withdraw_" | bc -l) )) 

        then 

                clear 

                echo -e "\nVocê não tem a quantia de R\$ $withdraw_\nVocê voltará ao menu principal" 

                MENU_PRINC 

 

        else 

                echo -e "\nNão aceitamos letras e nem simbolos\nVocê voltará ao menu principal" 

                MENU_PRINC 

        fi 

 

} 

see_balance(){ 

        clear 

echo -e "Seu saldo é de R\$:$balance" 

MENU_PRINC 

} 

deposit(){ 

        clear 

echo -e "Qual o valor que deseja depositar?" 

read depo_value 

verifyINTD 

balance=$(echo "$balance+$depo_value" | bc) 

echo "Seu saldo é de R\$:$balance" 

MENU_PRINC 

} 

leave(){ 

        clear 

echo "Obrigado por usar nossa aplicação" 

sleep 2 

clear 

exit 

} 

MENU_PRINC 
