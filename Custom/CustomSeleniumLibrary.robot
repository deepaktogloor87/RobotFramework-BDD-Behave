*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Key Launch Browser
    [Arguments]     ${BROWSER}
    open browser    ${NONE}      ${BROWSER}
    maximize browser window
    delete all cookies

Key Navigate To Url
    [Arguments]     ${URL}
    go to       ${URL}

Key Verify That Expected Element Is Visible Successfully
    [Arguments]     ${element}
    wait until page contains element    ${element}
    element should be visible    ${element}

Key Click Any Button
    [Arguments]     ${element}
    wait until element is visible    ${element}
    wait until element is enabled    ${element}
    set focus to element    ${element}
    click element    ${element}

Key Verify Expected Text Is Visible
    [Arguments]     ${text}
    wait until page contains    ${text}
    page should contain    ${text}

Key Input Text Into Text Field
    [Arguments]    ${element}       ${text}
    wait until page contains element    ${element}
    wait until element is visible       ${element}
    wait until element is enabled       ${element}
    clear element text                  ${element}
    input text    ${element}            ${text}

Key Enter Username And Password
    [Arguments]                       ${usr_element}    ${username}      ${password_element}     ${password}
    Key Input Text Into Text Field    ${usr_element}        ${username}
    Key Input Text Into Text Field    ${password_element}   ${password}

Key Select The Radio Button
    [Arguments]    ${element}     ${value}
    wait until element is visible    ${element}
    wait until element is enabled    ${element}
    select radio button    ${element}

Key Select The Label From DropDown List
    [Arguments]    ${locator}       ${value}
    wait until element is visible   ${locator}
    wait until element is enabled    ${locator}
    select from list by label    ${locator}       ${value}

Key Select The Checkbox
    [Arguments]    ${element}
    wait until element is visible       ${element}
    wait until element is enabled       ${element}
    checkbox should not be selected     ${element}
    select checkbox                     ${element}

Key Upload The File
    [Arguments]    ${element}    ${file_path}
    wait until page contains element    ${element}
    wait until element is visible       ${element}
    wait until element is enabled       ${element}
    choose file     ${element}    ${file_path}

Key Handle Alert
    handle alert    ACCEPT

Key get product list
    [Arguments]    ${locator}       ${count}
     ${item_elements}=      Get WebElements    ${locator}
     ${item_count}=    Get Length    ${item_elements}
     should be equal as strings    ${count}    ${item_count}

Key Scroll To Element
    [Arguments]    ${element}
    scroll element into view    ${element}