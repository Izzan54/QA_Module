*** Settings ***
#import library
Library  SeleniumLibrary
Resource    login.robot


*** Variable ***
${login_btn}        dt_login_button
${pw_field}         //*[@type="password"]
${login_oauth_bt}   //*[text()="Log in"]
${email_field}      name=email
${acc_info}         //*[@id="dt_core_account-info_acc-info"]
${demo_tab}         dt_core_account-switcher_demo-tab
${demo_btn}         //*[@id="dt_VRTC4795354"]/span
${dis_duration}     //*[@id="dropdown-display"]
${day_duration}     //*[@id="d"]


*** Keyword ***

*** Test Cases ***
Open Deriv
    Login    ${my_email}     ${my_pw}
    RiseContract
    LowerContract
    LowerBarrier
    Multiplier


