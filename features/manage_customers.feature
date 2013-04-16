Feature: Manage Customers
  In order to have tour bookings by customers
  As a booking manager
  I want to create and manage customers

  @javascript
  Scenario: Customers List
    Given I have customers named John Schultz, Cara Cummings
    When I go to the list of customers
    Then I should see "John Schultz"
    And I should see "Cara Cummings"

  @javascript
  Scenario: Add Valid Customer
    Given I have 0 customers
    And I am on the list of customers
    When I click button "New Customer"
    And I fill in "Name" with "Johnny"
    And I fill in "Email" with "johnny@domain.com"
    And I click button "Save"
    Then I should see "Johnny"
    And I should see "johnny@domain.com"
    And the url ends with "1"
    And I should have 1 customers
  
  
  




  
