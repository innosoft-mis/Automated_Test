*** Settings ***
Library		    SeleniumLibrary
Library        Collections
Library        RequestsLibrary
Library        JSONLibrary 

*** Variables ***
${URL}     http://10.35.29.184

*** Test Cases ***
Check API XX
  Create Session    login    ${URL}    verify=true
  ${body}    Load Json From File    request-json/post_login.json
  Log    ${body}    #To show all text in ${body}
  ${response}       POST On Session    login     /api/auth/login  json=${body}
  Log    ${response.status_code}
  Log    ${response.content}

  ${return_access_token}        Set Variable            ${response.json()}[access_token]
  ${return_code}    Convert To String    ${response.status_code}

  Should Be Equal    ${return_code}    200


# ${header}=    Create dictionary    Content-Type=application/x-www-form-urlencoded
# Create session    session    ${keycloke_host}    disable_warnings=1

# [Argruments]   ${data}
# ${response}=    Post Request    session     ${keycloke_url}       headers=${header}    data=${data}
# set test variable   ${response}     ${response}

# ${response}=    TO JSON    ${response.text}
# set test variable   ${access_token}     ${response['access_token']}
# ${access_token}=    Remove String    ${access_token}       '
# set test variable   ${keycloke_access_token}       ${access_token}