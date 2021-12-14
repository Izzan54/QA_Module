*** Settings ***
Documentation   Suite description
Library  SeleniumLibrary

*** Keywords ***
ClearReasonInput
    [Arguments]    ${input_field}
    Wait Until Page Contains Element    ${input_field}    5
    ${current_value}=    Get Element Attribute    ${input_field}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${input_field}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${input_field}   DELETE


DeactPage
    wait until page contains element    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/label[1]
    click element                       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/label[1]
    wait until page contains element    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/label[2]
    click element                       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/label[2]
    wait until page contains element    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/label[3]
    click element                       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/label[3]
    clearreasoninput                    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/div[1]/textarea
    input text                          //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/div[1]/textarea           I like everything about the app, but i think its need
    click element                       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/div[3]/div[2]/button[2]
    click element                       //*[@id="modal_root"]/div/div/div/div[2]/button[1]

