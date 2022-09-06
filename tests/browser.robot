*** Settings ***
Library  Collections
Library  SeleniumLibrary
Test Teardown  Close All Browsers

*** Variable ***
${URL}   https://www.google.com
${BROWSER}    CHROME
${REMOTE_URL}    http://selenium:4444/wd/hub

*** Test Cases ***
Hello browser
    [Tags]    BROWSER
    Run Keyword If    '${BROWSER}'=='headlesschrome'    Create Chrome Webdriver    ${URL}    ${REMOTE_URL}
    ...	  ELSE IF   '${BROWSER}'=='safari'    Create Safari Webdriver    ${URL}
    ...   ELSE     Log    Fail     Automation can support chrome and safari

*** Keywords ***
Create Chrome Webdriver
    [Documentation]    Create new chrome driver with options and capture page screenshot
    [Arguments]    ${url}    ${remote_url}
    Open Browser	 ${url}   headlesschrome    remote_url=${remote_url}
    Capture Page Screenshot

Create Safari Webdriver
    [Documentation]    Create new safari driver and capture page screenshot
    [Arguments]    ${url}
    Open Browser    ${url}    safari    executable_path=/usr/bin/safaridriver
    Capture Page Screenshot
