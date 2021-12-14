*** Settings ***
Documentation   Suite description
Library  SeleniumLibrary

*** Keywords ***
Login
    [arguments]     ${email}    ${pw}
    Open Browser    url=https://app.deriv.com   browser=chrome
    set window size     1280    1028
    wait until location does not contain    dt_core_header_acc-info-preloader
    wait until page contains element    ${login_btn}      60
    Click element   ${login_btn}
    wait until page contains element    ${email_field}     15
    input text  ${email_field}  ${email}
    input text  ${pw_field}   ${pw}
    click element  ${login_oauth_bt}

    wait until page does not contain element     dt_core_header_acc-info-preloader   90
    click element  //*[@id="dt_core_account-info_acc-info"]
    click element   dt_core_account-switcher_demo-tab
    click element   //*[@id="dt_VRTC4795354"]/span
    reload page

RiseContract
    wait until page does not contain element    //*[@class="chart-container__loader"]     90
    wait until page does not contain element    //*[text()="Loading interface..."]      60
    wait until page contains element        //*[@class="cq-menu-btn"]     90
    click element       //*[@class="cq-symbol-select-btn__container"]
    click element       //*[text()="Synthetic Indices"]
    click element       //*[text()="Volatility 10 (1s) Index"]
    wait until page contains element    //*[@id="dt_purchase_call_button"]      70
    click element       //*[@id="dt_purchase_call_button"]


ClearInput
    [Arguments]    ${input_field}
    Wait Until Page Contains Element    ${input_field}    5
    ${current_value}=    Get Element Attribute    ${input_field}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${input_field}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${input_field}   DELETE

LowerContract
    wait until page does not contain element    //*[@class="chart-container__loader"]     90
    wait until page does not contain element    //*[text()="Loading interface..."]      60
    wait until page contains element        //*[@class="cq-menu-btn"]     90
    click element       //*[@class="cq-symbol-select-btn__container"]
    click element       //*[text()="Forex"]
    click element       //*[text()="AUD/USD"]
    wait until page contains element        //*[@id="dt_contract_dropdown"]     60
    click element       //*[@id="dt_contract_dropdown"]
    click element       //*[text()="All"]
    click element       //*[text()="Higher/Lower"]
    clearinput          //*[@class="dc-input__field"]
    input text          //*[@class="dc-input__field"]       2
    click element       //*[@id="dc_payout_toggle_item"]
    clearinput          //*[@id="dt_amount_input"]
    input text          //*[@id="dt_amount_input"]        15.50
    wait until page contains element        //*[@id="dt_purchase_put_button"]
    click element       //*[@id="dt_purchase_put_button"]


LowerBarrier
    wait until page does not contain element    //*[@class="chart-container__loader"]     90
    wait until page does not contain element    //*[text()="Loading interface..."]      60
    wait until page contains element        //*[@class="cq-menu-btn"]     90
    click element       //*[@class="cq-symbol-select-btn__container"]
    click element       //*[text()="Forex"]
    click element       //*[text()="AUD/USD"]
    wait until page contains element        //*[@id="dt_contract_dropdown"]     60
    click element       //*[@id="dt_contract_dropdown"]
    click element       //*[text()="All"]
    click element       //*[text()="Higher/Lower"]
    clearinput          //*[@class="dc-input__field"]
    input text          //*[@class="dc-input__field"]       2
    clearinput          //*[@id="dt_barrier_1_input"]
    input text          //*[@id="dt_barrier_1_input"]       +1


Multiplier
    wait until page does not contain element    //*[@class="chart-container__loader"]     90
    wait until page does not contain element    //*[text()="Loading interface..."]      60
    wait until page contains element        //*[@class="cq-menu-btn"]     90
    click element       //*[@class="cq-symbol-select-btn__container"]
    click element       //*[text()="Synthetic Indices"]
    click element       //*[text()="Volatility 50 Index"]
    wait until page contains element        //*[@id="dt_contract_dropdown"]     60
    click element       //*[@id="dt_contract_dropdown"]
    click element       //*[@id="dc_multipliers_link"]
    click element       //*[@id="dt_contract_multiplier_item"]

    click element       //*[@class="dc-dropdown__container"]
    page should contain       //*[text()="x20"]

















