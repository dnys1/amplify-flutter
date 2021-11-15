Feature: Sign Up with Email

    Background:
        Given I run the example "sign-up-with-email"
        And I tap the "goToSignUpButton" button
        Then I should see the "signup" screen

    Scenario: Login mechanism set to "email"
        Then I expect the widget "emailSignUpFormField" to be present within 1 second
        And I expect the widget "usernameSignUpFormField" to be absent
        And I expect the widget "phoneNumberSignUpFormField" to be absent