Feature: Load Configuration
    Amplify should configure for valid configurations and throw an error for invalid ones.

    Scenario: Successfully configures for valid configuration
        Given I run the example "sign-in-with-email"
        Then I should see the "signin" screen
        And I should not see an error banner

    Scenario: Shows an error for an invalid configuration
        Given I run the example "bad-config"
        Then I should see an error banner