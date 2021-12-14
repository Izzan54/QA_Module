*** Settings ***
#import library
Library  SeleniumLibrary
Resource    login.robot
Resource    tokencases.robot

*** Variable ***
${login_btn}        dt_login_button
${pw_field}         //*[@type="password"]
${login_oauth_bt}   //*[text()="Log in"]
${email_field}      name=email


*** Test Cases ***
Token
    Login    ${my_email}     ${my_pw}
    ChangeAccount
    wait until page does not contain element     dt_core_header_acc-info-preloader   90
    click element       //*[@id="dt_core_header_acc-info-container"]/div[2]/div
    wait until page contains element    //*[@id="dc_api-token_link"]     60
    click element       //*[@id="dc_api-token_link"]
    scopes
    TokenName



