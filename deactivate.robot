*** Settings ***
#import library
Library  SeleniumLibrary
Resource    login.robot
Resource    tokencases.robot
Resource    deactivatecases.robot

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
    wait until page contains element    //*[@id="/account/deactivate-account"]     60
    click element       //*[@id="/account/deactivate-account"]
    wait until page contains element    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/button
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/button
    reasons