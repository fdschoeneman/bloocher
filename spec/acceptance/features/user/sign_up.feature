Feature: User sign up
  
  Background:
    Given I am on the home page
    And I am not logged in
    And no user exists with an email "robert.parker@test.com"

  Scenario: Successful signup via website
    Given I follow the "sign up" link
    And I fill in "email-sign-up" with "robert.parker@test.com"  
    And I press "Sign up and we'll confirm your email"
    And "robert.parker@test.com" should have 1 email with subject "Confirmation instructions"
    When I open the email to "robert.parker@test.com"
    And I follow the "Confirm my account" link in the email
    And I fill in "password" for user_password 
    And I fill in "password" for user_password_confirmation 
    And I press "Confirm that you are a bahler"
    Then I should see a notice with "Your account was successfully confirmed."

  