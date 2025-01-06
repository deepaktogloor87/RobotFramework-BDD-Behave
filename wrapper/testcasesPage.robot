*** Settings ***
Resource    ../Custom/CustomSeleniumLibrary.robot
Library    ../utilities/READ.py

*** Keywords ***
Click on 'Test Cases' button
    Key Click Any Button    ${HomePage['Navigation_bar']['TestCases_lnk']}

Verify user is navigated to test cases page successfully
    Key Verify Expected Text Is Visible    Test Cases