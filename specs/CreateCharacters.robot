*Settings*
Documentation    Suite de Teste do cadastro de personagens da API da marvel


Resource    ${EXECDIR}/resources/Base.robot

Library    ${EXECDIR}/resources/factories/Thanos.py

*Test Cases*
Deve Cadastrar Um Personagem

    Set Client Key    vuribi@gmail.com

    ${personagem}       Factory Thanos
    ${response}         POST New Character    ${personagem} 


    Status Should Be    200

Não deve cadastrar com o mesmo nome

    #Dado que Thanos ja existe
    ${personagem}    Factory Thanos
    POST New Character    ${personagem}

    #Quando faço uma requisição Post para a rota characters
    ${response}    POST New Character       ${personagem}


    #Então o código de retorno deve se 409
    Status Should Be    409    ${response}

    Should Be Equal    ${response.json()}[error]    Character already exists :(

    #https://www.youtube.com/watch?v=iTZ5unfIDvs&t=119s&ab_channel=QAninja  minuto 51:56



