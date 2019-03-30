 *** Variables ***
 ${BROWSER}  Chrome
 ${URL}  https://dtaconline.dtac.co.th/smartphones-tablets/apple.html

*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
workshop1
  เปิดเว็บ
  เปลี่ยนภาษา
#   เลือกมือถือ
#   เลือกเครืองเปล่า
#   เลือกสี
#   เลือกความจุ
#   กดใส่รถเข็น

*** Keywords ***
เปิดเว็บ
  Open Browser  ${URL}  ${BROWSER}
เปลี่ยนภาษา
  Click Element  id:switcher-language-trigger
  Click link  En
  Click link  iPhone XS
# เลือกเครืองเปล่า
# เลือกสี
# เลือกความจุ
# กดใส่รถเข็น
# Sleep  2
#   Click Button  name:btnK
