*** Settings ***
Resource    ../Custom/CustomSeleniumLibrary.robot
Library    ../utilities/READ.py
Library    OperatingSystem

*** Variables ***
${CONTACTUS_YAML_FILE}    ./POM/contact_us.yaml
${log_file_path}        C:/Users/Deepak/Desktop/RobotFrameworkPOM/Reports/log.html

*** Keywords ***
Initialization ContactUsPage Variables
    ${ContactUsPage}=    read_yaml_file    ${CONTACTUS_YAML_FILE}
    Set Suite Variable    ${ContactUsPage}    ${ContactUsPage}

Verify 'Get In Touch' is visible
    Key Verify Expected Text Is Visible    Get In Touch

Enter name, email, subject and message
    Key Input Text Into Text Field      ${ContactUsPage['Name_txtbx']}      cypress.io
    Key Input Text Into Text Field      ${ContactUsPage['Email_txtbx']}      cypress@io.com
    Key Input Text Into Text Field      ${ContactUsPage['Subject_txtbx']}      cypress.io
    Key Input Text Into Text Field      ${ContactUsPage['Message_txtbx']}      This is custom test message

Upload file
    log to console    ${log_file_path}
    Key Upload The File    ${ContactUsPage['ChooseFile_btn']}       ${log_file_path}

Click Submit button
    Key Click Any Button    ${ContactUsPage['Submit_btn']}

Click OK button
    Key Handle Alert

Verify success message 'Success! Your details have been submitted successfully.' is visible
    Key Verify Expected Text Is Visible    Success! Your details have been submitted successfully

Click 'Home' button and verify that landed to home page successfully
    Key Click Any Button    ${ContactUsPage['Home_btn']}
    Key Verify Expected Text Is Visible     Full-Fledged practice website for Automation Engineers
