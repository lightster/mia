Feature: user
  In order to use Mia Time Tracker, the user must create an account
  and sign in.

  Scenario: A user account can be created
    Given I am unauthenticated
    And I generate a unique ID called "SID"
    And I use a username of "createuser-{{SID}}"
    And I use a password of "password-{{SID}}"
    And I use an email of "createuser+{{SID}}@example.com"
    When I post to /v1/user
    Then I should receive an "OK" response
    And the username property should be "createuser-{{SID}}"
    And the password property should not be returned
    And the email property should be "createuser+{{SID}}@example.com"
