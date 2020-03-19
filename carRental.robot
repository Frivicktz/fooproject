*** Settings ***
Documentation                       This test suite is designed to test the car rental function at rental15.infotiv.net
Resource                            keywords.robot
Library                             SeleniumLibrary

Suite Setup     Begin Webtest
Suite Teardown  End webtest


*** Variables ***
${BROWSER} =    chrome
${URL} =    http://rental15.infotiv.net


*** Test Cases ***
An Email Should not be Used Twice
    [Documentation]                     An email should not be able to be used for two different accounts
    [Tags]                              Test 1; The email test

   Given Page Loaded

   And Create User Has Been Selected

   When Invalid Data Has Been Inserted    Fritz  Molin   1231231238    Fritz.molin@telia.com     Fritz.molin@telia.com   Bruh1233    Bruh1233

   And Creation Has Been Confirmed

   Then An Error Should Show Up





User can create an account
    [Documentation]                     User should be able to create an account by filling in all the required fields, according to the requirement list.
    [Tags]                              Test 2; user creation

   Given Page Loaded

   And Create User Has Been Selected

   When Valid Data Has Been Inserted    frizz  Molin   0012312392   Frit@yahoo.com     Frit@yahoo.com   Brah1210     Brah1210

   And Creation Has Been Confirmed

   Then The Login Page Should Be Open   frizz









User Should Be Able To Log in
    [Documentation]                      User should be able to log in with an already created account, according to the requirement list.
    [Tags]                               Test 3;The log-in Test

    Log Out

    Attempt Login                       Fritz.molin@live.se  Brah123

    Log In

    The Login Page Should Be Open       frizz



The Credit Card Input Should Not Accept More Or Less Than 16 Numbers
    [Documentation]                     According to the requirements list, the credit card bar should ask for 16 numbers, but what happens if more or less numbers are inputed
    [Tags]                              Test 4; The credit card test

    Page Loaded

    Log Out

    Attempt To Log In                    Fritz.molin@live.se  Brah123

    Log In

    The Login Page Should Be Open        frizz

    Continue To The Car Page

    Verify Car Page Loaded

    Choosing A Car
    
    Verify Credit Card Page Open

    Inserting Card Number                      1

    Inserting Name                             F

    Inserting Credit Card Date And Cvc         123

    Confirm Book

    Inserting Card Number                      123123123123123

    Confirm Book

    Inserting Card Number                      123123123123123123123123123

    Confirm Book

    Verify That The Book Is Completed




User Can Book A Car
    [Documentation]                     This tests the functionality of booking a car. Which means that all the steps: Selecting a car, inserting credit card information and that it shows up on My Page.
    [Tags]                              Test 5; The Car booking functionality test

    Page Loaded

    Log Out

    Attempting Login                                Fritz.molin@live.se  Brah123

    Log In

    The Login Page Should Be Open                   frizz

    Continue To The Car Page

    Verify Car Page Loaded

    Choosing A Car
    
    Verify Credit Card Page Open

    Inserting Card Number                          1234567890123456

    Inserting Name                                 F

    Inserting Credit Card Date And Cvc             155

    Confirm Book

    Verify That The Book Is Completed

    Check My Page

    Confirm Book Exists






