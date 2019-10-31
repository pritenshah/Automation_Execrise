*** Settings ***
Library    AppiumLibrary         
Variables    ../Config/MobConfig.py
Variables    ../Config/DeviceList.py    ${ENV_DEVIVE_ID}
Library    ExcelLibrary  
Library    String    
Library    Collections    
  

*** Keywords ***
Mobile Application Is Launched
    [Documentation]    Keyword to Open AUT
    Run Keyword If    '${ENV_DEVICE_OS}' == 'IOS'    Open iOS Application    
    ...    ELSE    Open Android Application
    Set Appium Timeout    30s
    
Open Android Application
    [Documentation]    Keyword to Open Android App
    Open Application    ${ENV_SERVER_URL}  
    ...    platformName=${platformName}    
    ...    platformVersion=${platformVersion}  
    ...    deviceName=${deviceName}   
    # ...    appPackage=${ENV_APP_PACKAGE}    
    # ...    appActivity=${ENV_APP_ACTIVITY}
    ...    app=${ENV_APK_LOCATION}

Open iOS Application
    [Documentation]    Keyword to Open iOS App
    Open Application    ${ENV_SERVER_URL}    
    ...    platformName=${platformName}
    ...    platformVersion=${platformVersion}  
    ...    deviceName=${deviceName}    
    ...    app={${ENV_IPA_LOCATION}



Close AUT
    [Documentation]    Keyword to close the app
    Capture Page Screenshot    
    Close All Applications
    
Load Test Data
    [Documentation]   Keyword to Load the Test Data

    ${dataFile}=    Set Variable    /Users/priten/eclipse-workspace/MaySession/WEbAutomationSession/Data/TestData.xlsx
    Open Excel Document    ${dataFile}    doc_id=1
    # Removing Unwanted String from Suite Name
    ${TEST_SUITE}=    Fetch From Right    ${SUITE_NAME}    .
    
    ${row_list}=    Read Excel Row    1    sheet_name=${TEST_SUITE} 
    ${col_index}=    Get Index From List    ${row_list}    TEST_NAME  
    ${col_index}=    Evaluate    ${col_index}+1

    
    ${col_list}=    Read Excel Column    ${col_index}       sheet_name=${TEST_SUITE}
     

    ${row_index}=    Get Index From List    ${col_list}    ${TEST_NAME}   
    ${row_index}=    Evaluate    ${row_index}+1    
    ${row_data}=    Read Excel Row    ${row_index}     sheet_name=${TEST_SUITE}        
    # &{data_dict}=    Create Dictionary  
    ${index}=    Set Variable    0 
    FOR    ${item}    IN    @{row_list}
        # Set To Dictionary    ${data_dict}    ${item}    @{row_data}[${index}]
        ${value}=    Convert To String    @{row_data}[${index}]
        Set Test Variable    ${gv_${item}}        ${value}
        ${index}=    Evaluate    ${index}+1    
    END    
    Close All Excel Documents
    # [Return]    ${data_dict}
    

Navigate To URL
    [Arguments]    ${param_URL}
    Run Keyword If    '${ENV_DEVICE_OS}' == 'IOS'    Navigate To URL IOS    ${param_URL}    
    ...    ELSE    Navigate to URL ANdroid    ${param_URL}
    ...    
Navigate To URL IOS
    [Documentation]    Keyword to Naviagte to URL
    [Arguments]    ${param_url}
    ${ctx}=   Get Contexts
    ${oldCtx}=    Switch To Context    @{ctx}[1]
    Go To Url    ${param_url}

    Switch To Context    ${oldCtx}
    
Navigate to URL ANdroid
    [Arguments]    ${param_URL}
    Wait Until Element Is Visible    id=com.android.chrome:id/url_bar    
    Input Text    id=com.android.chrome:id/url_bar     ${param_URL}
    Click Element     xpath=(//*[contains(@text,"${param_URL}")])[1]