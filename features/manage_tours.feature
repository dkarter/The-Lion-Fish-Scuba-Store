Feature: Manage Tours
  In order to offer tours to customers
  As a Booking Manager
  I want to be able to manage tours

  Scenario: Tour List
      Given I have tours named "Tour 1", "Tour 2", "Last Tour"
      When I go to the "tours list" page
      Then I should see "Tour 1"
      And I should see "Tour 2"
      And I should see "Last Tour"

  Scenario: Tour List Filtered By Date
      When I

  Scenario: Add A Valid Tour
      When 

  Scenario: Do Not Add Invalid Tour
      When 

  Scenario: Cancel Tour and Refund Difference to Customers
      When 

  Scenario: Increase Tour Price
      When 

  Scenario: Decrease Tour Price and Refund Difference to Customers
      When 

  
