Feature: User adds a Category
  Rather than free-form tagging, tags (Categories) must be added by an
  authenticated user before they can be used.

  Scenario: Getting to the Category Manager
    Given I'm a User
    And I'm on the homepage
    When I click on Manage Categories
    Then I land on the Category Manager
    And I see a form to add a new Category

  Scenario: Adding a Category
    Given I'm on the Category Manager
    When I submit a new Category name
    Then I land on the Category Manager
    And the Category is created
    And it appears in the Category List
