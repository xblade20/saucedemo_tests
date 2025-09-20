*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot
Library     SeleniumLibrary
Library    Collections
Library    String

Suite Setup    Open Sauce Demo
Suite Teardown    Close Browser If Open
Test Teardown    Run Keyword If    '${TEST STATUS}' == 'FAIL'    Capture Page Screenshot    screenshots/${TEST NAME}.png

*** Test Cases ***
Products are displayed after login
    [Tags]    smoke
    Login With Credentials    ${VALID_USER}    ${VALID_PW}
    Verify Login Success

Sort Price Low To High - Verify Order
    [Tags]    regression
    Login With Credentials    ${VALID_USER}    ${VALID_PW}
    Wait Until Element Is Visible    ${SORT_DROPDOWN}
    Select From List By Label    ${SORT_DROPDOWN}    Price (low to high)

    @{price_elements}=    Get WebElements    ${PRODUCT_PRICE}
    ${prices}=    Create List

    FOR    ${el}    IN    @{price_elements}
        ${text}=    Get Text    ${el}
        ${clean}=   Replace String    ${text}    $    ${EMPTY}
        ${price}=   Convert To Number    ${clean}
        Append To List    ${prices}    ${price}
    END

    ${sorted}=    Evaluate    sorted(${prices})
    Should Be Equal    ${prices}    ${sorted}

