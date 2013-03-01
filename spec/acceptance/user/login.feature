Feature: Login
  In order to get access to the site
  As a user
  I want to sign in

  Background:
    Given I am not logged in
    And I am on the home page
    And I follow the "login" link

    Scenario: Unregistered user attempts to log in
      Given no user exists with an email of "unregistered@sender.com"
      And I fill in "email-login" with "unregistered@sender.com"
      And I fill in "Password" with "notregisteredpassword"
      And I press "Login and start blooching"
      Then show me the page
      Then I should see a notice with "Invalid email or password."
      
    # Scenario: Registered user enters wrong password
    #   Given a user exists with an email of "registered@signuptester.com"
    #   Given I fill in "Email" with "registered@signuptester.com"
    #   And I fill in "Password" with "wrongpassword"
    #   And I press "Login"
    #   Then I should see a notice with "Invalid email or password."
    
    # Scenario: Registered user signs in
    #   Given a user exists with an email of "registered@signuptester.com"
    #   And I fill in "Email" with "registered@signuptester.com"
    #   And I fill in "Password" with "password"
    #   And I press "Login"
    #   Then I should see a notice with "You are now logged in"
