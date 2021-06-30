*** Settings ***
Documentation       Aqui estarão presentes todos os exercícios do prime experts.
...                 Lembrando que é de suma importância termos a descrição de cada arquivo.


*** Variables ***
${NOME}     Helder

&{PESSOA}      
...             nome=Helder     
...             sobrenome=Fernandes     
...             idade=27
...             carro=Sentra
...             sexo=masculino
...             cpf=12365498745


@{FRUTAS}       abacaxi     laranja     morango     banana      maçã

@{PAISES}       Brasil      Canada      Japão       China       Russia

*** Test Case ***
Cenario: Imprimir todas as informações da PESSOA contidas no dicionario
    Log To Console              ${PESSOA.nome}
    Log To Console              ${PESSOA.sobrenome}
    Log To Console              ${PESSOA.idade}
    Log To Console              ${PESSOA.carro}
    Log To Console              ${PESSOA.sexo}
    Log To Console              ${PESSOA.cpf}

Cenario: Imprimir lista de FRUTAS
    Log To Console              ${FRUTAS[0]}
    Log To Console              ${FRUTAS[1]}
    Log To Console              ${FRUTAS[2]}
    Log To Console              ${FRUTAS[3]}
    Log To Console              ${FRUTAS[4]}

Cenario: Meu teste de soma
    [Tags]          SOMA
    ${RESULTADO}                Somar dois numeros  658  845
    Log To Console              ${RESULTADO}

    ${RESULTADO_B}              Somar os numeros "1562" e "1895"
    Log To Console              ${RESULTADO_B}

Cenario: Criando meu e-mail
    [Tags]          EMAIL
    ${EMAIL_NOVO}   Criando e-mail  Helder  Fernandes  27
    Log To Console  ${EMAIL_NOVO}


Cenario: Utilizando o FOR na pratica
    [Tags]          LUPING
    Contar de 0 a 9

    Percorrer itens de uma lista

Cenario: FOR exercicio 
    [Tags]          EXERC_1
    Contador de 0 a 10

Cenario: FOR exercicio 
    [Tags]          EXERC_2
    Imprimindo os países

Cenario: Validando o IF
    [Tags]          TESTE_IF
    Else e IF com FOR   7       10

*** Keywords ***
Somar dois numeros 
    [Arguments]     ${NUM_A}    ${NUM_B}
    ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}
    [Return]    ${SOMA}

Somar os numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}
    [Return]        ${SOMA}

Criando e-mail
    [Arguments]       ${NOME}       ${SOBRENOME}        ${IDADE}
    ${EMAIL}          Catenate      SEPARATOR=_     ${NOME}     ${SOBRENOME}    ${IDADE}@robot.com
    [Return]          ${EMAIL}
    
Contar de 0 a 9
    FOR  ${count}   IN RANGE   0   9
        Log To Console      ${count}
    END

Percorrer itens de uma lista
    FOR  ${frutas}  IN      @{FRUTAS}
        Log To Console      ${frutas}
    END

Contador de 0 a 10
    FOR  ${numero}  IN RANGE   0   10
        Log To Console      Estou no número: ${numero}
    END

Imprimindo os países
    FOR   ${país}   IN  @{PAISES}
        Log To Console      Estou no ${país}
    END

Else e IF com FOR
    [Arguments]         ${NUM_A}        ${NUM_B}
    FOR   ${numero}     IN RANGE    ${NUM_A}        ${NUM_B}

        IF  '${numero}'=='5'
            Log To Console      Estou no número: ${numero}
        ELSE IF  '${numero}'=='8'
            Log To Console      Estou no número: ${numero}
        END

    END