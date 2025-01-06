*** Settings ***
Resource    ../Custom/CustomSeleniumLibrary.robot
Library    ../utilities/READ.py

*** Variables ***
${PRODUCTS_YAML_FILE}    ./POM/products.yaml

*** Keywords ***
Initialization ProductsPage Variables
    ${ProdutsPage}=    read_yaml_file    ${PRODUCTS_YAML_FILE}
    Set Suite Variable    ${ProdutsPage}    ${ProdutsPage}

Click on 'Products' button
    Key Click Any Button    ${HomePage['Navigation_bar']['Products_lnk']}

Verify user is navigated to ALL PRODUCTS page successfully
    Key Verify Expected Text Is Visible    All Products

The products list is visible
    Key get product list    ${ProdutsPage['AllProducts_lst']}       34

Enter product name in search input and click search button
    Key Input Text Into Text Field      ${ProdutsPage['ProductSearch_txtbx']}       Jeans
    Key Click Any Button    ${ProdutsPage['Search_btn']}

Verify 'SEARCHED PRODUCTS' is visible
    Key Verify Expected Text Is Visible    Soft Stretch Jeans
    Key Verify Expected Text Is Visible    Regular Fit Straight Jeans
    Key Verify Expected Text Is Visible    Grunt Blue Slim Fit Jeans

Verify all the products related to search are visible
    Key get product list    ${ProdutsPage['AllProducts_lst']}       3

