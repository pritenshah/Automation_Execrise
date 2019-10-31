*** Settings ***
Library    AppiumLibrary    
Resource    ../Common/MobileCommon.resource

*** Variables ***
${lbl_Home_Tab}    accessibility_id=Home
${lbl_DashBoard_Tab}  accessibility_id=Dashboard  
${lbl_Notifications_Tab}  accessibility_id=Notifications
${lbl_top_bar}    id=com.interview.testapp:id/action_bar

*** Keywords ***
Text Home on the main screen Is Displayed 
    [Documentation]    KW to Verify Text Home on the main screen Is Displayed 
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Home" and @resource-id="com.interview.testapp:id/message"]    2s    Text Home is Not Displayed on Screen
    
Home Tab Is Selected
    [Documentation]    KW to Verify Home Tab is selected
    Wait Until Element Is Visible    ${lbl_Home_Tab}   10s
    ${selected}=    Get Element Attribute    ${lbl_Home_Tab}    selected    
    Should Be True    '${selected}'=='true'    Home Tab Is not Selected.
    
Tap on Dashboard tab
    [Documentation]    Tap on Dashboard Tab
    Wait Until Element Is Visible    ${lbl_DashBoard_Tab}    10s
    Tap    ${lbl_DashBoard_Tab}    
    
Text Dashboard on the main screen Is Displayed 
    [Documentation]    KW to Verify Text Home on the main screen Is Displayed 
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Dashboard" and @resource-id="com.interview.testapp:id/message"]    2s    Text Dashboard is Not Displayed on Screen
    
    
Only Dashboard icon is highlighted
    [Documentation]    KW to Verify Only Dashboard icon is highlighted
    Wait Until Element Is Visible    ${lbl_DashBoard_Tab}   10s
    ${selected}=    Get Element Attribute    ${lbl_DashBoard_Tab}    selected    
    Should Be True    '${selected}'=='true'   DashBoard Tab Is Not Selected

    ${selected}=    Get Element Attribute    ${lbl_Home_Tab}    selected    
    Should Not Be True    '${selected}'=='true'   Home Tab is Selected But it should not
    
    ${selected}=    Get Element Attribute    ${lbl_Notifications_Tab}    selected    
    Should Not Be True    '${selected}'=='true'   Notifications Tab is Selected But it should not
    
    
Tap on Notifications tab
    [Documentation]   Tap on Notifications tab
    Wait Until Element Is Visible    ${lbl_Notifications_Tab}    10s
    Tap    ${lbl_Notifications_Tab}    
    
Text Notifications on the main screen Is Displayed 
    [Documentation]    KW to Verify Text Notification on the main screen Is Displayed 
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Notifications" and @resource-id="com.interview.testapp:id/message"]    2s    Text Notifications is Not Displayed on Screen
    
    
Only Notifications icon is highlighted
    [Documentation]    KW to Verify Only Notifications icon is highlighted
    Wait Until Element Is Visible    ${lbl_Notifications_Tab}   10s
    ${selected}=    Get Element Attribute    ${lbl_Notifications_Tab}    selected    
    Should Be True    '${selected}'=='true'   Notification Tab Is Not Selected

    ${selected}=    Get Element Attribute    ${lbl_Home_Tab}    selected    
    Should Not Be True    '${selected}'=='true'   Home Tab is Selected But it should not
    
    ${selected}=    Get Element Attribute    ${lbl_DashBoard_Tab}    selected    
    Should Not Be True    '${selected}'=='true'   Dashboard Tab is Selected But it should not
    
Top Bar Is Always Visible
    [Documentation]    KW to Verify Top Bar Is Always Visible
    Wait Until Element Is Visible    ${lbl_top_bar}    10s    Top Bar Is Not Visible
    Tap on Dashboard tab
    Wait Until Element Is Visible    ${lbl_top_bar}    10s    Top Bar Is Not Visible
    Tap on Notifications tab
    Wait Until Element Is Visible    ${lbl_top_bar}    10s    Top Bar Is Not Visible
    
Text testApp on the bar Is Displayed 
    [Documentation]    KW to Text testApp on the bar Is Displayed  
    Wait Until Element Is Visible    xpath=//*[contains(@resource-id,"action_bar")]//*[@text="testApp"]   2s    Text testApp is Not Displayed on Screen
    
    