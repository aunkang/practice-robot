*** Settings ***
Library  HttpLibrary.HTTP
Test Setup  Call Exchangerates Api

*** Variables ***
${URL}  api.exchangeratesapi.io
${SERVICE_PATH}  /latest
${PROTOCOL}  https
${BASE_EXCHANGE_RATE}  "THB"
# ${BASE_EXCHANGE_RATE}

*** Test Cases ***
Call Exchangerates Api Should Success
  Call Exchangerates Api
Base Exchangerates Should Be EUR
  Get Base Exchangerates

*** Keywords ***
Call Exchangerates Api
  Create Http Context  ${URL}  ${PROTOCOL}
  Get  ${SERVICE_PATH}
  Response Status Code Should Equal  200
  ${body} =  Get Response body
  ${BASE_EXCHANGE_RATE} =  Get Json Value  ${body}  /base
  Set Global Variable  ${BASE_EXCHANGE_RATE}

Get Base Exchangerates
  Should Be Equal  ${BASE_EXCHANGE_RATE}  "EUR"