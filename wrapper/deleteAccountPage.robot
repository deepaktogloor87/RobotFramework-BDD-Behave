*** Settings ***
Resource    ../Custom/CustomSeleniumLibrary.robot
Library    ../utilities/READ.py

*** Variables ***
${DELETEACCOUNT_YAML_FILE}    ./POM/deleteAccount.yaml


*** Keywords ***
Initialization DeleteAccountPage Variables
    ${DeleteAccountPage}=    read_yaml_file    ${DELETEACCOUNT_YAML_FILE}
    Set Suite Variable    ${DeleteAccountPage}    ${DeleteAccountPage}


Verify that 'ACCOUNT DELETED!' is visible and click 'Continue' button
    Key Verify That Expected Element Is Visible Successfully    ${DeleteAccountPage['AccountDeleted_txt']}
    Key Click Any Button    ${DeleteAccountPage['Continue_btn']}