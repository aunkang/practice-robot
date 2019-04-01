*** Settings ***
Library  HttpLibrary.HTTP
Test Setup  Call Exchangerates Api

*** Variables ***
${URL}  api.exchangeratesapi.io
${SERVICE_PATH}  /latest
${WRONG_SERVICE_PATH}  /latestdsfds
${PROTOCOL}  https
${BASE_EXCHANGE_RATE}  "THB"
${EXPECTED_ERROR_MESSAGE}  "time data 'latestdsfds' does not match format '%Y-%m-%d'"
# ${BASE_EXCHANGE_RATE}

*** Test Cases ***
Call Exchangerates Api Should Success
  Call Exchangerates Api

Base Exchangerates Should Be EUR
  Get Base Exchangerates

Call Exchangerates Should Be Failed
  Get Wrong Exchangerates

Base Exchangerates Should Be THB
  Get Exchangerates In THB


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

Get Wrong Exchangerates
  Create Http Context  ${URL}  ${PROTOCOL}
  Next Request May Not Succeed
  Get  ${WRONG_SERVICE_PATH}

  ${body} =  Get Response body
  ${error_msg} =  Get Json Value  ${body}  /error
  Should Be Equal  ${error_msg}  ${EXPECTED_ERROR_MESSAGE}

Get Exchangerates In THB
  Get  ${SERVICE_PATH}?base=THB

  Response Status Code Should Equal  200
  ${body} =  Get Response body
  ${base} =  Get Json Value  ${body}  /base

  Should Be Equal  ${base}  "THB"

  