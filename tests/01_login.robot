*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot
Library     SeleniumLibrary

Suite Setup    Open Sauce Demo
Suite Teardown    Close Browser If Open
Test Teardown    Run Keyword If    '${TEST STATUS}' == 'FAIL'    Capture Page Screenshot    screenshots/${TEST NAME}.png

*** Test Cases ***
Login - Successful
    [Tags]    smoke    regression
    Login With Credentials    ${VALID_USER}    ${VALID_PW}
    Verify Login Success

Login - Invalid Credentials
    [Tags]    negative
    Login With Credentials    ${INVALID_USER}    ${INVALID_PW}
    Verify Login Failure Message    Epic sadface: Username and password do not match any user in this service

Login - Locked User
    [Tags]    negative
    Login With Credentials    ${LOCKED_USER}    ${VALID_PW}
    Verify Login Failure Message    Epic sadface: Sorry, this user has been locked out.
