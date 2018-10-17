Feature: User actions
  Scenario: An photo can be showed for an logged user
    Given I am a logged user with "Thomas" as a name
    And with a created user called "Alibaba"
    And I am in the users page
    When I click on the "Alibaba" button
    Then I should see "Alibaba" details

  Scenario: A logged in user can follow another user
    Given I am a logged user with "Alice" as a name
    And with a created user called "Alibaba"
    And I am in the user page
    When I click on the "Follow" button on the "Alibaba" card
    Then "Alice" should follow "Alibaba"