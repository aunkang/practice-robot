 *** Variables ***
 ${BROWSER}  Chrome
 ${URL}  https://www.google.co.th

*** Settings ***
Library  SeleniumLibrary
# Suite Setup  เปิดเว็บ
Test Setup  เปิดเว็บ
Suite Teardown  Close All Browsers

*** Test Cases ***

ค้นหาข้อมูล
  [Tags]  hello  oneWithThree  all
#   เปิดเว็บ
  กรอกข้อมูล  สวัสดี
  คลิกค้นหา

ค้นหาข้อมูล2
  [Tags]  bye  all
#   เปิดเว็บ
  กรอกข้อมูล  บาย
  คลิกค้นหา

ค้นหาข้อมูล3
  [Tags]  byeHello  oneWithThree  all
#   เปิดเว็บ
  กรอกข้อมูล  บาย สวัสดี
  คลิกค้นหา

*** Keywords ***
เปิดเว็บ
  Open Browser  ${URL}  ${BROWSER}
กรอกข้อมูล
  [Arguments]  ${word}
  Input Text  name:q  ${word}
คลิกค้นหา
# Sleep  2
  Click Button  name:btnK

