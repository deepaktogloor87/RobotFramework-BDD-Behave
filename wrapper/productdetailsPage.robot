*** Settings ***
Resource    ../Custom/CustomSeleniumLibrary.robot
Library    ../utilities/READ.py

*** Variables ***
${PRODUCTSDETAILS_YAML_FILE}    ./POM/productdetails.yaml

*** Keywords ***
Initialization ProductsdetailsPage Variables
    ${ProdutsdetailsPage}=    read_yaml_file    ${PRODUCTSDETAILS_YAML_FILE}
    Set Suite Variable    ${ProdutsdetailsPage}    ${ProdutsdetailsPage}

Click on 'View Product' of first product
    Key Click Any Button    ${ProdutsPage['View_Product_btn']}

Verify that detail detail is visible: product name, category, price, availability, condition, brand
    ${productname}=    get text    ${ProdutsdetailsPage['productName_txt']}
    should be equal as strings    ${productname}    Blue Top
    ${category}=    get text    ${ProdutsdetailsPage['productCategory_txt']}
    should be equal as strings    ${category}    Category: Women > Tops
    ${price}=    get text    ${ProdutsdetailsPage['productPrice_txt']}
    should be equal as strings    ${price}    Rs. 500
    ${availability}=    get text    ${ProdutsdetailsPage['productAvailability_txt']}
    should be equal as strings    ${availability}    Availability: In Stock
    ${condition}=    get text    ${ProdutsdetailsPage['productCondition_txt']}
    should be equal as strings    ${condition}    Condition: New
    ${brand}=    get text    ${ProdutsdetailsPage['productBrand_txt']}
    should be equal as strings    ${brand}    Brand: Polo