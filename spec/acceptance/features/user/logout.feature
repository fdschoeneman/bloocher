Feature: Sign out

  Scenario: Logged in user signs out
    Given I am logged in as a user
    When I am on the home page
    And I follow the "itch neem'r" link
    Then I should see a notice with "Successfully logged out"