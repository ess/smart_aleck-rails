Feature: User adds an Entry
  A User can add an entry to any given category view. They need only browse to
  the desired category combination, then add an entry.

  Scenario: Adding an Entry
    Given I'm a User
    And there are existing Categories
    And I'm on the homepage
    When I browse to a Category context
    Then I see an option to add an Entry to the context

    When I submit a new Entry
    Then I land back on the Category context
    And the new entry is displayed