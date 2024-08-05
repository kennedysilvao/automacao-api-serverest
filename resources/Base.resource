*** Settings ***
Documentation    Configurações iniciais

Library    libs/user.py
Resource    requests/users/post_users.resource
*** Variables ***
${API}    https://serverest.dev