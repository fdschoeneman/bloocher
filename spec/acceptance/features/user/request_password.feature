Feature: Request password reset
  In order log into my account
  As a registered user who has lost my password
  I want to reset my password

    Background:
      Given no user exists with an email "unregistered@test.com"
      And a user with email "registered@test.com" and password "password"
      And I am not logged in
      And I am on the home page
      And I follow the "login" link
      And I follow the "Forgot your password?" link

    Scenario: User attempts to reset password with the wrong email
      When I fill in "unregistered@test.com" for "user_email"
      And I press "Send me reset password instructions"
      Then I should see an error notice with "not found"
    
    Scenario: User resets her password with the correct email
      When I fill in "registered@test.com" for "user_email"
      And I press "Send me reset password instructions"
      Then I should see a notice with "You will receive an email with instructions"
      And "registered@test.com" should have an email with subject "Reset password instructions"
      When I open the email to "registered@test.com"
      And I follow the "Change my password" link in the email
      And I fill in "newpassword" for "user_password"
      And I fill in "newpassword" for "user_password_confirmation"
      And I press "Change my password"
      Then I should see a notice with "Your password was changed successfully. You are now signed in."

