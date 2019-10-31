*** Settings ***
Resource  ../Resources/PageObject/TestAppPage.resource

*** Test Cases ***
US1
    When Mobile Application Is Launched
    Then Home Tab Is Selected
    And Text Home on the main screen Is Displayed
    
US2
    Given Mobile Application Is Launched
    When Tap on Dashboard tab
    Then Text Dashboard on the main screen Is Displayed
    And Only Dashboard icon is highlighted
    
US3
    Given Mobile Application Is Launched
    When Tap on Notifications tab
    Then Text Notifications on the main screen Is Displayed
    And Only Notifications icon is highlighted
    
US4
    When Mobile Application Is Launched
    Then Top Bar Is Always Visible
    And Text testApp on the bar Is Displayed