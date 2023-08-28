*** Settings ***
Library		    SeleniumLibrary
Library        Collections
Library        RequestsLibrary
Library        JSONLibrary 

*** Variables ***
${URL}     xxx

*** Test Cases ***
Check API XX
  Create Session    xxx    ${URL}    verify=true
  ${response}     GET On Session    xxx     /user/afj
  Log    ${response.content}
  ${return_code}    Convert To String    ${response.status_code}
  Should Be Equal    ${return_code}    200
