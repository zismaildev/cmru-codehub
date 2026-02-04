*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${BROWSER}       chrome
${SELSPEED}      0.3s
# ส่วนกำหนดข้อมูลสำหรับ Test (แก้ไขตรงนี้ได้เลย)
${FIRST_NAME}    nattapong
${LAST_NAME}     panthiya
${MOBILE}        0825952349
${PASSWORD}      123456789
${BIRTH_DAY}     13
${BIRTH_MONTH}   2      # 1=ม.ค., 2=ก.พ.
${BIRTH_YEAR}    2004

*** Test Cases ***
Register Facebook
    [Setup]    Run Keywords    Open Browser    https://www.facebook.com/    ${BROWSER}
    ...                        AND             Set Selenium Speed           ${SELSPEED}
    
    # 1. คลิกปุ่ม "สร้างบัญชีใหม่"
    Wait Until Element Is Visible    xpath=//a[@data-testid='open-registration-form-button']
    Click Element                    xpath=//a[@data-testid='open-registration-form-button']

    # 2. รอให้ฟอร์มโหลดเสร็จ
    Wait Until Element Is Visible    name=firstname

    # 3. กรอกข้อมูลโดยดึงจาก Variables ด้านบน
    Input Text       name=firstname      ${FIRST_NAME}
    Input Text       name=lastname       ${LAST_NAME}
    Input Text       name=reg_email__    ${MOBILE}
    Input Text       name=reg_passwd__   ${PASSWORD}
    
    # วันเกิด
    Select From List By Value    id=day      ${BIRTH_DAY}
    Select From List By Value    id=month    ${BIRTH_MONTH}
    Select From List By Value    id=year     ${BIRTH_YEAR}
    
    # เพศ (เลือก ชาย = 2)
    Click Element    xpath=//input[@name='sex' and @value='2']
    
    # 4. ถ่ายรูปหน้าจอเก็บไว้เป็นหลักฐาน (ไฟล์จะชื่อ facebook_result.png)
    Capture Page Screenshot    filename=facebook_result.png

    [Teardown]    Close Browser