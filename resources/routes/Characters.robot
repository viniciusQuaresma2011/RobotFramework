*Settings*
Documentation           Acoes da rota



*Keywords*
POST New Character
    [Arguments]     ${payload}


    ${response}    POST 
        ...            ${API_URL}/characters
        ...            json=${payload}
        ...            headers=${HEADERS}
        ...            expected_status=any


    [return]        ${response}



