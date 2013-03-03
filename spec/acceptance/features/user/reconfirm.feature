Feature: Reconfirmation
  As a registered but unconfirmed user
  In order to confirm my account
  I want to request a new confirmation email be sent to my email address

  Scenario: Request new confirmation for unconfirmed user
    Given a unconfirmed_user with email "unconfirmed@test.com" and password "password"
    And I am not logged in
    And I am on the home page
    And I follow the "Didn't receive confirmation instructions?" link
    And I fill in "unconfirmed@test.com" for user_email
    And I press "Resend confirmation instructions"
    Then I should see a notice with "You will receive an email with instructions"
    And "unconfirmed@test.com" should have an email
    When I open the email to "unconfirmed@test.com"
    When I follow the "Confirm my account" link in the email
    And I fill in "password" for user_password 
    And I fill in "password" for user_password_confirmation 
    And I press "Confirm that you are a bahler"
    Then I should see a notice with "successfully confirmed"

Scenario: Confirmed user mistakenly requests new confirmation
    Given a confirmed_user with email "confirmed@test.com" and password "password"
    And I am not logged in
    And I am on the home page
    And I follow the "Didn't receive confirmation instructions?" link
    And I fill in "confirmed@test.com" for user_email
    And I press "Resend confirmation instructions"
    Then I should see a notice with "already confirmed, please try signing in"
