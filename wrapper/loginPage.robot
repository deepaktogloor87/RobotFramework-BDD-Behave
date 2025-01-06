*** Settings ***
Resource    ../Custom/CustomSeleniumLibrary.robot
Library    ../utilities/READ.py

*** Variables ***
${ENV_FILE}    .env
${LOGIN_YAML_FILE}    ./POM/login.yaml

*** Keywords ***
Initialization LoginPage Variables
    ${env}=    read_env_file    ${ENV_FILE}
    set suite variable    ${env}    ${env}
    ${LoginPage}=    read_yaml_file    ${LOGIN_YAML_FILE}
    Set Suite Variable    ${LoginPage}    ${LoginPage}

Verify 'New User Signup!' is visible
    Key Verify Expected Text Is Visible    New User Signup!

Enter name and email address
    Key Enter Username And Password
    ...     ${LoginPage['New_User_Signup']['Name_txtbx']}               ${env['CRED']['USERNAME']}
    ...     ${LoginPage['New_User_Signup']['Eamil_Address_txtbx']}      ${env['CRED']['EMAIL']}

Click 'Signup' button
    Key Click Any Button    ${LoginPage['New_User_Signup']['SignUp_btn']}

Verify 'Login to your account' is visible
    Key Verify Expected Text Is Visible    Login to your account

Enter name and already registered email address
    Key Enter Username And Password
    ...     ${LoginPage['New_User_Signup']['Name_txtbx']}               ${env['CRED']['USERNAME']}
    ...     ${LoginPage['New_User_Signup']['Eamil_Address_txtbx']}      ${env['CRED']['EMAIL']}

Enter correct email address and password
    Key Enter Username And Password
    ...     ${LoginPage['Login_to_your_account']['Email_Address_txtbx']}               ${env['CRED']['EMAIL']}
    ...     ${LoginPage['Login_to_your_account']['Password_txtbx']}      ${env['CRED']['PASSWORD']}

Enter incorrect email address and incorrect password
    Key Enter Username And Password
    ...     ${LoginPage['Login_to_your_account']['Email_Address_txtbx']}               ${env['CRED']['IN_EMAIL']}
    ...     ${LoginPage['Login_to_your_account']['Password_txtbx']}      ${env['CRED']['IN_PASSWORD']}

Verify Your email or password is incorrect! message is visible
    Key Verify Expected Text Is Visible    Your email or password is incorrect!

Verify error 'Email Address already exist!' is visible
    Key Verify Expected Text Is Visible    Email Address already exist!

Click 'Login' button
    Key Click Any Button    ${LoginPage['Login_to_your_account']['Login_btn']}