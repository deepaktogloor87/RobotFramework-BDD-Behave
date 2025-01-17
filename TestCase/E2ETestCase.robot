*** Settings ***
Library    SeleniumLibrary
Resource    ../wrapper/loginPage.robot
Resource    ../wrapper/homePage.robot
Resource    ../wrapper/signupPage.robot
Resource    ../wrapper/accountCreatedPage.robot
Resource    ../wrapper/contactusPage.robot
Resource    ../wrapper/deleteAccountPage.robot
Resource    ../wrapper/productsPage.robot
Resource    ../wrapper/productdetailsPage.robot
Resource    ../wrapper/testcasesPage.robot

Suite Setup     Suite Initialization
Test Setup      Launch Browser and Land on Homepage
Test Teardown   Close All Browsers

*** Keywords ***
Suite Initialization
    Initialization HomePage Variables
    Initialization LoginPage Variables
    Initialization SignUpPage Variables
    Initialization AccountCreatedPage Variables
    Initialization DeleteAccountPage Variables
    Initialization ContactUsPage Variables
    Initialization ProductsPage Variables
    Initialization ProductsdetailsPage Variables

*** Test Cases ***
Scenario_01:User Registration
    Given Verify 'New User Signup!' is visible
    And Enter name and email address
    And Click 'Signup' button
    And Verify that 'ENTER ACCOUNT INFORMATION' is visible
    And Fill details: Title, Name, Email, Password, Date of birth
    And Select checkbox 'Sign up for our newsletter!'
    And Select checkbox 'Receive special offers from our partners!'
    And Fill details: First name, Last name, Company, Address, Address2, Country, State, City, Zipcode, Mobile Number
    And Click 'Create Account button'
    And Verify that 'ACCOUNT CREATED!' is visible
    And Click 'Continue' button
    Then Verify that 'Logged in as username' is visible

Scenario_02:User Login
    Given Verify 'Login to your account' is visible
    And Enter correct email address and password
    And Click 'login' button
    Then Verify that 'Logged in as username' is visible

Scenario_03:User Logout
    Given Verify 'Login to your account' is visible
    When Enter correct email address and password
    And Click 'Login' button
    And Verify that 'Logged in as username' is visible
    Then Click on 'Logout' button

Scenario_04:Register User with existing email
    Given Verify 'New User Signup!' is visible
    When Enter name and already registered email address
    And Click 'Signup' button
    Then Verify error 'Email Address already exist!' is visible

Scenario_05:Delete User Account
    Given Verify 'Login to your account' is visible
    When Enter correct email address and password
    And Click 'Login' button
    And Verify that 'Logged in as username' is visible
    And Click 'Delete Account' button
    Then Verify that 'ACCOUNT DELETED!' is visible and click 'Continue' button

Scenario_06:Login User with incorrect email and incorrect password
    Given Verify 'Login to your account' is visible
    When Enter incorrect email address and incorrect password
    And Click 'Login' button
    Then Verify Your email or password is incorrect! message is visible

Scenario_07:Contact Us Form
    [Tags]    Debug
    Given Click On Contact Us button
    When Verify 'Get In Touch' is visible
    And Enter name, email, subject and message
    And Upload file
    And Click Submit button
    And Click OK button
    And Verify success message 'Success! Your details have been submitted successfully.' is visible
    Then Click 'Home' button and verify that landed to home page successfully

Scenario_08:Verify Test Cases Page
    [Tags]    New
    When Click on 'Test Cases' button
    Then Verify user is navigated to test cases page successfully

Scenario_09:Search Product
    [Tags]    New
    Given Click on 'Products' button
    When Verify user is navigated to ALL PRODUCTS page successfully
    And Enter product name in search input and click search button
    And Verify 'SEARCHED PRODUCTS' is visible
    Then Verify all the products related to search are visible

Scenario_10:Verify All Products and product detail page
    [Tags]    New
    Given Click on 'Products' button
    When Verify user is navigated to ALL PRODUCTS page successfully
    And The products list is visible
    And Click on 'View Product' of first product
    Then Verify that detail detail is visible: product name, category, price, availability, condition, brand

Scenario_11:Verify Subscription in home page
    [Tags]    New
    Given Scroll down to footer
    When Verify text 'SUBSCRIPTION'
    And Enter email address in input and click arrow button
    Then Verify success message 'You have been successfully subscribed!' is visible