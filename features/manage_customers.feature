Feature: Manage Customers
  In order to have tour bookings by customers
  As a booking manager
  I want to create and manage customers


  Scenario: Customers List
    Given I have customers named "John Schultz", "Cara Cummings"
    When I go to the "customers list" page
    Then I should see "John Schultz"
    And I should see "Cara Cummings"


  Scenario: Add Valid Customer
    Given I have 0 customers
    And I am on the "customers list" page
    When I click link "New"
    And I fill in "Name" with "Johnny"
    And I fill in "Email" with "johnny@domain.com"
    And I click button "Create Customer"
    Then I should see "Johnny"
    And I should see "johnny@domain.com"
    And the url ends with "1"
    And I should have 1 customers
  
  Scenario: Delete A Customer
      Given I have customers named "ABC XYZ", "BCD EFG"
      And I have 2 customers
      And I am on the "customers list" page
      When I press on "Destroy"
  




  
