*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot
Resource   locators.robot

*** Keywords ***
Open Sauce Demo
    [Arguments]    ${browser}=${BROWSER}
    Open Browser    ${BASE_URL}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

Close Browser If Open
    Run Keyword And Ignore Error    Close All Browsers

Login With Credentials
    [Arguments]    ${username}    ${password}
    Go To    ${BASE_URL}             # Ensures we’re back on login page
    Wait Until Element Is Visible    ${USERNAME_FIELD}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button  ${LOGIN_BTN}

Verify Login Success
    Wait Until Element Is Visible    ${PRODUCT_LIST}
    Page Should Contain Element      ${PRODUCT_LIST}

Verify Login Failure Message
    [Arguments]    ${expected_msg}
    Wait Until Element Is Visible    ${ERROR_BANNER}
    Element Text Should Be           ${ERROR_BANNER}    ${expected_msg}

Add Product To Cart By Name
    [Arguments]    ${product_name}
    ${locator}=    Set Variable    xpath=//div[@class="inventory_item"]//div[text()="${product_name}"]/ancestor::div[contains(@class,"inventory_item")]//button
    ${btn_text}=   Get Text    ${locator}
    Run Keyword If    '${btn_text}' == 'Add to cart'    Click Button    ${locator}



Get Cart Count
    ${exists}=    Run Keyword And Return Status    Page Should Contain Element    ${CART_BADGE}
    IF    ${exists}
        ${count}=    Get Text    ${CART_BADGE}
    ELSE
        ${count}=    Set Variable    0
    END
    RETURN    ${count}

Remove Product From Cart By Name
    [Arguments]    ${product_name}
    Click Button    xpath=//div[@class="cart_item"]//div[@class="inventory_item_name" and text()="${product_name}"]/ancestor::div[@class="cart_item"]//button[text()="Remove"]



Capture Screenshot On Failure
    [Arguments]    ${test_name}
    Capture Page Screenshot    ${OUTPUT_DIR}/screenshots/${test_name}.png
