*** Settings ***
Documentation    POST users

Library    RequestsLibrary
Resource    ../../Base.resource

*** Keywords ***
Criar usuario como administrador
    [Arguments]    ${payload}

    ${HEADER}    Create Dictionary    Content-Type=application/json
    Create Session    alias=serverest    url=${API}    headers=${HEADER}    disable_warnings=1

    ${response}    POST On Session    url=${API}/usuarios    alias=serverest
    ...    json=${payload}
    
    Set Test Variable    ${response}

Validar que o status code é ${status_code}
    [Arguments]    ${response_status_code}
    Should Be Equal As Strings    ${response_status_code}    ${status_code}

Validar mensagem de usuario cadastrado
    [Arguments]    ${response_message}    ${expected_message}

    Should Be Equal As Strings    ${response_message}    ${expected_message}

Validar que o ID não é vazio
    [Arguments]    ${response_id}

    Should Not Be Empty    ${response_id}
Criar usuario sem preencher todos os campos
    [Arguments]    ${payload}

    ${HEADER}    Create Dictionary    Content-Type=application/json
    Create Session    alias=serverest    url=${API}    headers=${HEADER}    disable_warnings=1

    ${response}    POST On Session    url=${API}/usuarios    alias=serverest
    ...    json=${payload}    expected_status=400
    
    Set Test Variable    ${response}

Validar mensagem de erro
    [Arguments]    ${response_message}    ${expected_message}

    Should Be Equal As Strings    ${response_message}    ${expected_message}