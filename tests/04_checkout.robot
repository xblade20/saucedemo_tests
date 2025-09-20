*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot
Library     SeleniumLibrary

Suite Setup    Open Sauce Demo
Suite Teardown    Close Browser If Open
Test Teardown    Run Keyword If    '${TEST STATUS}' == 'FAIL'    Capture Page Screenshot    screenshots/${TEST NAME}.png

*** Test Cases ***
Checkout with valid details - success
    [Tags]    regression
    Login With Credentials    ${VALID_USER}    ${VALID_PW}
    Add Product To Cart By Name    Sauce Labs Backpack
    Click Element    ${CART_ICON}
    Click Button     ${CHECKOUT_BTN}
    Input Text       ${FIRST_NAME}    Rahul
    Input Text       ${LAST_NAME}     Sharma
    Input Text       ${POSTAL_CODE}   110001
    Click Button     ${CONTINUE_BTN}
    Click Button     ${FINISH_BTN}
    Wait Until Element Is Visible    ${ORDER_COMPLETE}
    Element Text Should Be            ${ORDER_COMPLETE}    Thank you for your order!

Attempt checkout with empty cart - still available
    [Tags]    observation
    Login With Credentials    ${VALID_USER}    ${VALID_PW}
    Click Element    ${CART_ICON}
    ${count}=    Get Cart Count
    Should Be Equal As Integers    ${count}    0
    Page Should Contain Element    ${CHECKOUT_BTN}

