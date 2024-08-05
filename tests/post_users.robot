*** Settings ***
Documentation    Tests of Signup API

Resource    ../resources/Base.resource

*** Test Cases ***
Caso de teste 01: Deve realizar o cadastro de um administrador com sucesso
    [Documentation]    CT01 - Deve realizar o cadastro com sucesso
    [Tags]    admin_signup_successfuly

    ${name}    Generate Name
    ${email}    Generate Email
    
    ${user}    Create Dictionary
    ...    nome=${name}
    ...    email=${email}
    ...    password=pwd123
    ...    administrador=true
    
    ${expected_message}    Set Variable    Cadastro realizado com sucesso

    Criar usuario como administrador    ${user}
    Validar que o status code é 201    ${response.status_code}
    Validar mensagem de usuario cadastrado    ${response.json()['message']}    ${expected_message}
    Validar que o ID não é vazio    ${response.json()['_id']}

Caso de teste 02: Nome não deve ser vazio
    [Documentation]    CT02 - Nome não deve ser vazio
    [Tags]    empty_name

    ${user}    Create Dictionary
    ...    nome=${EMPTY}
    ...    email=kennedy22@qa.com
    ...    password=pwd123
    ...    administrador=true
    
    ${expected_message}    Set Variable    nome não pode ficar em branco

    Criar usuario sem preencher todos os campos    ${user}
    Validar que o status code é 400    ${response.status_code}
    Validar mensagem de erro    ${response.json()['nome']}    ${expected_message}

Caso de teste 03: Email não deve ser vazio
    [Documentation]    CT03 - Email não deve ser vazio
    [Tags]    empty_email

    ${user}    Create Dictionary
    ...    nome=Kennedy Silva
    ...    email=${EMPTY}
    ...    password=pwd123
    ...    administrador=true
    
    ${expected_message}    Set Variable    email não pode ficar em branco

    Criar usuario sem preencher todos os campos    ${user}
    Validar que o status code é 400    ${response.status_code}
    Validar mensagem de erro    ${response.json()['email']}    ${expected_message}

Caso de teste 04: Senha não deve ser vazio
    [Documentation]    CT04 - Senha não deve ser vazio
    [Tags]    empty_password

    ${user}    Create Dictionary
    ...    nome=Kennedy Silva
    ...    email=kennedy22@qa.com
    ...    password=${EMPTY}
    ...    administrador=true
    
    ${expected_message}    Set Variable    password não pode ficar em branco

    Criar usuario sem preencher todos os campos    ${user}
    Validar que o status code é 400    ${response.status_code}
    Validar mensagem de erro    ${response.json()['password']}    ${expected_message}