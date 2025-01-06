*** Settings ***
Resource    ../Custom/CustomSeleniumLibrary.robot
Library    ../utilities/READ.py

*** Variables ***
${ACCOUNTCREATED_YAML_FILE}    ./POM/accountCreated.yaml

*** Keywords ***
Initialization AccountCreatedPage Variables
    ${AccountCreatedPage}=    read_yaml_file    ${ACCOUNTCREATED_YAML_FILE}
    Set Suite Variable    ${AccountCreatedPage}    ${AccountCreatedPage}

Verify that 'ACCOUNT CREATED!' is visible
    Key Verify That Expected Element Is Visible Successfully     ${AccountCreatedPage['AccountCreated_txt']}

Click 'Continue' button
    Key Click Any Button                        ${AccountCreatedPage['Continue_btn']}