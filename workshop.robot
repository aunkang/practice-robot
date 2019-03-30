 *** Variables ***
 ${BROWSER}  Chrome
 ${URL}  https://dtaconline.dtac.co.th/smartphones-tablets/apple.html

*** Settings ***
Library  SeleniumLibrary
Suite Setup  เปิดเว็บ

*** Test Cases ***
workshop1
  เปลี่ยนภาษา
  เลือกมือถือ
  เลือกเครืองเปล่า
  เลือกสี
  เลือกความจุ
  กดใส่รถเข็น
  กดถัดไป
  กรอกข้อมูล  jarturon  ponlab  jarturon@orcsoft.co.th  023333333

*** Keywords ***
เปิดเว็บ
  Open Browser  ${URL}  ${BROWSER}
เปลี่ยนภาษา
  Sleep  2
  Click Element  id:switcher-language-trigger
  Click link  En
เลือกมือถือ
  Sleep  3
  Click Button  id:product-1552
  
  
เลือกเครืองเปล่า
  Sleep  3
  Click link  Handset only
เลือกสี
  Click Element  id:option-label-color-93-item-14
เลือกความจุ
  Click Element  id:option-label-choose_capacity-143-item-10
หยิบใส่รถเข็น
  Click Button  id:product-addtocart-button
กดถัดไป
  Sleep  3
  Click Button  xpath://*[@id="maincontent"]/div[3]/div/div[4]/div[3]/ul/li/button
กรอกข้อมูล
  [Arguments]  ${fName}  ${lName}  ${email}  ${mobile}
  Input Text  name:firstname  ${fName}
  Input Text  name:lastname  ${lName}
  Input Text  name:email  ${email}
  Input Text  name:mobile  ${mobile}
# Sleep  2
#   Click Button  name:btnK
