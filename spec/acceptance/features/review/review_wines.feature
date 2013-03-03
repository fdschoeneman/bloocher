Feature: Review wines
  In order to feel special
  As a reviewer
  I want to review a wine

  Scenario: Logged in user reviews a wine from its page 
    Given I am logged in as a user
    And I am on a wine's page
    And I press "blooch about this wine"
    And I fill in "early pear, late harvest" for "review_content"
    And I press "Publish this blooch"
    Then I should see a notice with ""


  
