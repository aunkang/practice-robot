*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***

ค้นหาข้อมูล
  เปิดเว็บ
#   กรอกข้อมูล  สวัสดี
#   คลิกค้นหา

*** Keywords ***
เปิดเว็บ
   Open Browser  https://www.google.co.th  Chrome


# *** Variables ***
# ${BROWSER}  Chrome
