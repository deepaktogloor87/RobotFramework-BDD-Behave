*** Settings ***
Resource    ../Custom/CustomSeleniumLibrary.robot
Library    ../utilities/READ.py

*** Variables ***
${ENV_FILE}    .env
${SIGNUP_YAML_FILE}    ./POM/signup.yaml

*** Keywords ***
Initialization SignUpPage Variables
    ${env}=    read_env_file    ${ENV_FILE}
    set suite variable    ${env}    ${env}
    ${SignupPage}=    read_yaml_file    ${SIGNUP_YAML_FILE}
    Set Suite Variable    ${SignupPage}    ${SignupPage}

Verify that 'ENTER ACCOUNT INFORMATION' is visible
    Key Verify That Expected Element Is Visible Successfully     ${SignupPage['Account_Information']['Heading_txt']}

Fill details: Title, Name, Email, Password, Date of birth
    Key Click Any Button                        ${SignupPage['Account_Information']['radio']['Mrs']}
    Key Input Text Into Text Field              ${SignupPage['Account_Information']['Password_txtbx']}      ${env['CRED']['PASSWORD']}
    Key Select The Label From DropDown List     ${SignupPage['Account_Information']['Date_Of_Birth_ddbx']['Day']}           15
    Key Select The Label From DropDown List     ${SignupPage['Account_Information']['Date_Of_Birth_ddbx']['Month']}         May
    Key Select The Label From DropDown List     ${SignupPage['Account_Information']['Date_Of_Birth_ddbx']['Year']}          1987

Select checkbox 'Sign up for our newsletter!'
    Key Select The Checkbox                     ${SignupPage['Account_Information']['Sign_up_for_our_newsletter_chkbx']}

Select checkbox 'Receive special offers from our partners!'
    Key Select The Checkbox                     ${SignupPage['Account_Information']['Receive_special_offers_from_our_partners']}

Fill details: First name, Last name, Company, Address, Address2, Country, State, City, Zipcode, Mobile Number
    Key Input Text Into Text Field              ${SignupPage['Address_Information']['First_Name_txtbx']}      cypress.io
    Key Input Text Into Text Field              ${SignupPage['Address_Information']['Last_Name_txtbx']}      cypress.io
    Key Input Text Into Text Field              ${SignupPage['Address_Information']['Company_txtbx']}      cypress.io
    Key Input Text Into Text Field              ${SignupPage['Address_Information']['Address_txtbx']}      cypress.io
    Key Input Text Into Text Field              ${SignupPage['Address_Information']['Address2_txtbx']}      cypress.io
    Key Select The Label From DropDown List     ${SignupPage['Address_Information']['Country_ddl']}         Singapore
    Key Input Text Into Text Field              ${SignupPage['Address_Information']['State_txtbx']}      cypress.io
    Key Input Text Into Text Field              ${SignupPage['Address_Information']['City_txtbx']}      cypress.io
    Key Input Text Into Text Field              ${SignupPage['Address_Information']['Zipcode_txtbx']}      565801
    Key Input Text Into Text Field              ${SignupPage['Address_Information']['Mobile_txtbx']}      9999999999

Click 'Create Account button'
    Key Click Any Button                        ${SignupPage['Create_Account_btn']}