Feature: Edit settings
  In order to reflect my current situation
  As a registered user
  I want to edit my settings

  Background: 
    Given I am logged in as a user with email "dane.cook@test.com" and password "groovy"
    And I am on the "users/edit" path
  
  Scenario: Logged in user changes email with wrong password
    When I fill in "public.dane.cook@test.com" for user_email
    And I fill in "wrongpassword" for user_current_password
    And I press "Update"
    Then I should see a notice with "is invalid"
    
  Scenario: Logged in user changes email with correct password
    When I fill in "public.dane.cook@test.com" for user_email
    And I fill in "groovy" for user_current_password
    And I press "Update"
    And I should see a notice with "we need to verify your new email"
    And "public.dane.cook@test.com" should have an email
    When I open the email to "public.dane.cook@test.com"
    And I follow the "Confirm my account" link in the email
    Then I should see a notice with "successfully confirmed"

  Scenario: Logged in user fails to change password without current password
    When I fill in "newpassword" for user_password 
    And I fill in "newpassword" for user_password_confirmation
    And I press "Update"
    Then I should see a notice with "can't be blank"

  Scenario: Logged in user fails to change password with incorrect current password
    When I fill in "newpassword" for user_password 
    And I fill in "newpassword" for user_password_confirmation
    And I fill in "wrongcurrentpassword" for user_current_password
    And I press "Update"
    Then I should see a notice with "is invalid" 

  Scenario: Logged in user successfully changes password
    When I fill in "newpassword" for user_password 
    And I fill in "newpassword" for user_password_confirmation
    And I fill in "groovy" for user_current_password
    And I press "Update"
    Then I should see a notice with "updated your account successfully" 

  Scenario: Logged in user changes share on review setting
    When I select the share on review checkbox

