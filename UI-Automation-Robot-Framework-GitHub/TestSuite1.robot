*** Variables ***
${LOGIN_EMAIL}     REPLACE_WITH_TEST_EMAIL
${LOGIN_PASSWORD}  REPLACE_WITH_TEST_PASSWORD
${site}           https://www.aliexpress.com/
${search}         smart watch

*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           BuiltIn

*** Test Cases ***
VerifyCategory
    Open Browser    https://www.aliexpress.com/    Edge
    Wait Until Element Is Visible    class:_24EHh
    Click Image    class:_24EHh
    Input Text    id=search-words    smart watch
    Click Element    css:.search--submit--2VTbd-T.search--newSubmit--3BlVRKw
    Wait Until Element Is Visible    name=maxPrice
    Input Text    name=minPrice    580
    Input Text    name=maxPrice    1249
    Click Element    class=hv_hy
    sleep    2s
    ${elements}=    Get WebElements    xpath=//div[@class="jr-kr"]
    ${in_range}=    Set Variable    True
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        ${price}=    Evaluate    re.sub(r'[^\d.]', '', '''${text}''')    re
        ${price}=    Convert To Number    ${price}
        Run Keyword If    ${price} < 580 or ${price} > 1249    Set Variable    ${in_range}    False
    END
    Should Be True    ${in_range}

VerifyCartAdd
    Open Browser    ${site}    Edge
    Maximize Browser Window
    Wait Until Element Is Visible    class:_24EHh
    Click Image    class:_24EHh
    Input Text    id=search-words    ${search}
    Click Element    css:.search--submit--2VTbd-T.search--newSubmit--3BlVRKw
    Wait Until Element Is Visible    xpath=//a[contains(@class, 'search-card-item')]
    Click Element    xpath=//a[contains(@class, 'search-card-item')]
    Wait Until Element Is Visible    class:mk_a8
    Click Element    class:mk_a8
    Wait Until Element Is Visible    xpath=//button[span[contains(text(), 'أضف إلى العربة')]]
    Click Element    xpath=//button[span[contains(text(), 'أضف إلى العربة')]]
    Click Element    xpath=//div[contains(@class, 'shop-cart--menuItem')]
    Wait Until Page Contains    إكمال طلب
    Page Should Contain    إكمال طلب
    Reload Page
    sleep    5s

VerifySearch
    Open Browser    ${site}    Edge
    Wait Until Element Is Visible    class:_24EHh
    Click Image    class:_24EHh
    Input Text    id=search-words    ${search}
    Click Element    css:.search--submit--2VTbd-T.search--newSubmit--3BlVRKw
    Wait Until Page Contains    ساعة
    Page Should Contain    ساعة
    sleep    2s

VerChgLang
    Open Browser    ${site}    Edge
    Maximize Browser Window
    Wait Until Element Is Visible    class:_24EHh
    Click Image    class:_24EHh
    Wait Until Element Is Visible    css:.ship-to--menuItem--WdBDsYl.ship-to--newMenuItem--2Rw-XvE
    Click Element    css:.ship-to--menuItem--WdBDsYl.ship-to--newMenuItem--2Rw-XvE
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'العربية')]
    Click Element    xpath=//*[contains(text(), 'العربية')]
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'English')]
    Click Element    xpath=//*[contains(text(), 'English')]
    Click Element    xpath=//*[contains(text(), 'حفظ')]
    Wait Until Page Contains    Register
    Page Should Contain    Register
    sleep    10s

VerSignIn_
    Open Browser    ${site}    Edge
    Wait Until Element Is Visible    class:_24EHh
    Click Image    class:_24EHh
    Maximize Browser Window
    Mouse Over    css=.my-account--menuItem--1GDZChA.my-account--newMenuItem--bSu9Hkj
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'تسجيل دخول')]
    Click Button    xpath=//*[contains(text(), 'تسجيل دخول')]
    Wait Until Element Is Visible    xpath=//input[@label='البريد الإلكتروني']
    Input Text    xpath=//input[@label='البريد الإلكتروني']    ${LOGIN_EMAIL}
    Press Key    xpath=//input[@label='البريد الإلكتروني']    \\13
    Wait Until Element Is Visible    xpath=//input[@label='كلمه السر']
    Input Text    xpath=//input[@label='كلمه السر']    ${LOGIN_PASSWORD}
    Wait Until Element Is Enabled    css=.cosmos-btn.cosmos-btn-primary.cosmos-btn-large.cosmos-btn-block.cosmos-btn-rtl
    Click Button    css=.cosmos-btn.cosmos-btn-primary.cosmos-btn-large.cosmos-btn-block.cosmos-btn-rtl
    sleep    10s

VerCurChg
    Open Browser    ${site}    Edge
    Wait Until Element Is Visible    class:_24EHh
    Click Image    class:_24EHh
    Maximize Browser Window
    Wait Until Element Is Visible    css:.ship-to--menuItem--WdBDsYl.ship-to--newMenuItem--2Rw-XvE
    Click Element    css:.ship-to--menuItem--WdBDsYl.ship-to--newMenuItem--2Rw-XvE
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'EGP ( الجنيه المصري )')]
    Click Element    xpath=//*[contains(text(), 'EGP ( الجنيه المصري )')]
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'EGP ( الجنيه المصري )')]
    Click Element    xpath=//*[contains(text(), 'USD ( الدولار الأمريكي )')]
    Click Element    xpath=//*[contains(text(), 'حفظ')]
    Reload Page
    Wait Until Page Contains    US $
    Page Should Contain    US $
    sleep    2s

VerProdZoom
    Open Browser    https://ar.aliexpress.com/item/1005008673951944.html?spm=a2g0o.productlist.main.8.4319TqZhTqZhJb&aem_p4p_detail=202505011917253741583925788600004413765&algo_pvid=331c238f-b49f-48cb-9e03-2e0b1e034674&algo_exp_id=331c238f-b49f-48cb-9e03-2e0b1e034674-7&pdp_ext_f=%7B%22order%22%3A%22194%22%2C%22eval%22%3A%221%22%7D&pdp_npi=4%40dis%21EGP%212066.82%211074.74%21%21%21270.00%21140.40%21%402102f0c917461522448156314ee7bb%2112000046188988010%21sea%21EG%216344893927%21ABX&curPageLogUid=kcKOqVUZUHHr&utparam-url=scene%3Asearch%7Cquery_from%3A&search_p4p_id=202505011917253741583925788600004413765_2    Edge
    sleep    20s
    Mouse Over    class=magnifier--behiver--cY4D2TR
    Element Should Be Visible    css=.image-view-v2--next--pCikfXh
    sleep    5s

VerChgCnt
    Open Browser    ${site}    Edge
    Wait Until Element Is Visible    class:_24EHh
    Click Image    class:_24EHh
    Maximize Browser Window
    Wait Until Element Is Visible    css:.ship-to--menuItem--WdBDsYl.ship-to--newMenuItem--2Rw-XvE
    Click Element    css:.ship-to--menuItem--WdBDsYl.ship-to--newMenuItem--2Rw-XvE
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'مصر')]
    Click Element    css:.select--text--1b85oDo
    Click Element    xpath=(//div[contains(@class, 'select--item')])[1]
    Click Element    xpath=//*[contains(text(), 'حفظ')]
    Reload Page
    Wait Until Element Is Visible    class:esm--upload-container--2PH_U0Y
    Mouse Over    class:esm--upload-container--2PH_U0Y\n
    Mouse Over    css:.ship-to--menuItem--WdBDsYl.ship-to--newMenuItem--2Rw-XvE\n
    Page Should Contain    Local Shipping
    Page Should Contain    $
    sleep    5s
