*** Settings ***
Library             SeleniumLibrary
Suite Setup         Open Browser           
Suite Teardown      Close Browser   

*** Variables ***
${URL}        https://reg.up.ac.th/
${BROWSER}    Chrome
${USERNAME}   testuser
${PASSWORD}   correctpass
${WRONGPASS}  wrongpass


*** Keywords ***
Open Browser To Reg
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s

Go To Login Page
    Go To    ${URL}
    Sleep    2s

Input Username
    [Arguments]    ${user}
    Input Text    name=username    ${user}

Input Password
    [Arguments]    ${pass}
    Input Text    name=password    ${pass}

Click Login
    Click Button    name=login
    Sleep    2s

    
*** Test Cases ***
Login Success
    Go To Login Page
    Input Username    ${USERNAME}
    Input Password    ${PASSWORD}
    Click Login
    Page Should Contain    

Login Failed With Wrong Password
    Go To Login Page
    Input Username    ${USERNAME}
    Input Password    ${WRONGPASS}
    Click Login
    Page Should Contain    
