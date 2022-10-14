Feature: Testing karate scenario

  Background:
    Given url "https://reqres.in"


  @get_users
  Scenario Outline: Get users scenario - <scenario>
    And path 'api/users/<user>'
    When method get
    Then status 200
    * print 'resp'
    * print response
    And match response.data contains { id: <user>, first_name: #(name) }

    @user_1
    Examples:
      | scenario | user | name   |
      | user1    | 1    | George |