Feature: Review wines
  In order to feel special
  As a reviewer
  I want to review a wine from a list of wines on a winery's page

  Scenario: Logged in user reviews a wine from a winery's page 
    Given I am logged in as a user
    And I am on a winery's page
    And I press the review button for the first wine
    And I fill in "early pear, late harvest" for "review_content"
    And I press "Publish this blooch"
    Then I should see a notice with "successfully created"

  Scenario: Unregistered user reviews a wine and signs up from a winery's page   
    Given I am not logged in
    And I am on a winery's page
    And I press the review button for the first wine
    And I fill in "early pear, late harvest" for "review_content"
    And I fill in "unregistered@test.com" for "review_user_email"
    And I press "Publish this blooch"
    Then I should see a notice with "successfully created"

  Scenario: Unregistered user fails to review a wine without providing email  
    Given I am not logged in
    And I am on a winery's page
    When I press the review button for the first wine
    And I fill in "late harvest, early pear" for "review_content"
    And I press "Publish this blooch"
    Then I should see a notice with "Please login"

