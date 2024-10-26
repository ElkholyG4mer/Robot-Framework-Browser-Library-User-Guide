*** Settings ***
Library    Browser

*** Variables ***
${WIDTH}         1920
${HEIGHT}        1080
${URL}    https://automationexercise.com/
${loginTabButton}   //a[@href="/login"]
${emailTextField}   //input[@data-qa="login-email"]
${passwordTextField}   //input[@data-qa="login-password"]
${loginButton}  //button[@data-qa="login-button"]
${logoutButton}   //a[@href="/logout"]
${loginHeader}  //div[@class="login-form"]//h2
${headerExpectedText}   Login to your acco


*** Test Cases ***
Open Example Website
    New Browser    chromium    headless=${False}
    New Page    ${URL}
    Set Viewport Size    ${WIDTH}    ${HEIGHT}
    Click   ${loginTabButton}
    ${headerActualText}=  Get Text    ${loginHeader}
    Run Keyword And Continue On Failure    Should Be Equal    ${headerActualText}    ${headerExpectedText}
    Fill Text    ${emailTextField}    mostafa.elkholy@gmail.com
    Fill Text    ${passwordTextField}    abcd123456
    Click    ${loginButton}
    Get Element States    ${logoutButton}   validate    visible
    Close Browser