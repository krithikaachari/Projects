Feature: Logon to instagram
  verify a positive login
  verify a negative login

  Scenario: User authentication - Positive
    Given I am on the instagram login page
    And I give "EATest" for username
    And I give "EATest123" for password
    When I click on the login button
    Then I should land on edit profile page
    And I should have "eatest" on top of the page

  Scenario: User authentication - Negative
    Given I am on the instagram login page
    And I give "EATest" for username
    And I give "EATest1234" for password
    When I click on the login button
    Then I should see error on page
    And I should be on login page