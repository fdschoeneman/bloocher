Feature: Login
  In order to get access to the site
  As a user
  I want to sign in

  Background:
    Given a user with email "registered@signuptester.com" and password "password"
    And no user exists with an email "unregistered@sender.com"
    And I am not logged in
    And I am on the home page
    And I follow the "login" link

    Scenario: Unregistered user attempts to log in
      When I fill in "email-login" with "unregistered@sender.com"
      And I fill in "password-login" with "notregisteredpassword"
      And I press "Login and start blooching"
      Then I should see a notice with "Invalid email or password."

    Scenario: Registered user enters wrong password
      When I fill in "email-login" with "registered@signuptester.com"
      And I fill in "password-login" with "wrongpassword"
      And I press "Login and start blooching"
      Then I should see a notice with "Invalid email or password."
    
    Scenario: Registered user signs in
      Given I fill in "email-login" with "registered@signuptester.com"
      And I fill in "password-login" with "password"
      And I press "Login and start blooching"
      Then I should see a notice with "Logged in successfully"
