*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot
Library     SeleniumLibrary

Suite Setup    Open Sauce Demo
Suite Teardown    Close Browser If Open
Test Teardown    Run Keyword If    '${TEST STATUS}' == 'FAIL'    Capture Page Screenshot    screenshots/${TEST NAME}.png

*** Test Cases ***
Add two products and verify cart count
    [Tags]    smoke    regression
    Login With Credentials    ${VALID_USER}    ${VALID_PW}
    Add Product To Cart By Name    Sauce Labs Backpack
    Add Product To Cart By Name    Sauce Labs Bike Light
    ${count}=    Get Cart Count
    Should Be Equal As Integers    ${count}    2

Remove product and verify cart updates
    [Tags]    regression
    Login With Credentials    ${VALID_USER}    ${VALID_PW}
    Add Product To Cart By Name    Sauce Labs Backpack
    Add Product To Cart By Name    Sauce Labs Bike Light
    Click Element    ${CART_ICON}
    Remove Product From Cart By Name    Sauce Labs Backpack
    ${count}=    Get Cart Count
    Should Be Equal As Integers    ${count}    1



