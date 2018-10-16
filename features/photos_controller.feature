Feature: User actions
  Scenario: An user can see the title and description of the photo
    Given I am a logged user with "Hello there" as a name
    And there is a photo called "Golden Fish"
    And user goes to the photos page
    When I click on "Golden Fish"
    Then I see the photo details for "Golden Fish"
    