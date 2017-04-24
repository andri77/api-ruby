
Feature: As Myer One App user, I want to make API calls for Myer VISA application

  @api-visa
  Scenario: As Myer One App user, I want to apply VISA cards for new user
    Given As Myer One App user, I want to register for temporary account

#    Check Myer One welcome email
#    Check Myer Visa application email or communication

  Scenario Outline: As Myer One App user, I want to apply VISA cards for new user
    Given As Myer One App user, I want to apply VISA cards for <user>
    And I confirm that <user> myer one account is created
    When I validate that <user> had been setup as Primary Card Holder
    And I will get the following response:
      |welcomeMessage        | Your credit card application had been received |
    Examples:
      | user         |
      | new user     |
#    Check Myer One welcome email
#    Check Myer Visa application email or communication


  Scenario Outline: As Myer One App user, I want to apply VISA cards for inactive user
    Given As Myer One App user, I want to apply VISA cards for <user>
    And I confirm that <user> myer one account is activated
    When I validate that <user> had been setup as Primary Card Holder
    And I will get the following response:
      |welcomeMessage        | Your credit card application had been received |
    Examples:
      | user                     |
      | Inactive Myer One member |
    #    Check Myer One welcome email
#    Check Myer Visa application email or communication

  Scenario Outline: As Myer One App user, I want to apply VISA cards for primary and additional myer one member
    Given As Myer One App user, I want to apply VISA cards for <user>
    When I validate that <user> had been setup as Primary Card Holder
    Then I validate that the <flag> is return is as expected
    And I will get the following response:
      |welcomeMessage        | Your credit card application had been received |
    Examples:
      | user                        | flag        |
      | Primary Myer one member     | Primary     |
      | Additional Myer one member  | Additional  |
#    Check Myer Visa application email or communication
#   Check Myer Visa points for secondary/additional will be going to Primary

  Scenario Outline: As Myer One App user, I want to apply VISA cards for either both primary Myer One members or both Additional Card holders
    Given As Myer One App user, I want to apply VISA cards for both primary Myer One members <user1> and <user2>
    When I validate that <user1> had been setup as Primary Card Holder
    And <user1> can confirm the tier of Myer one membership
    Then I validate that <user2> had been setup as Secondary Card Holder
    And <user2> can confirm the tier of Myer one membership
    And I will get the following response:
      |welcomeMessage        | Your credit card application had been received |
    Examples:
      | user1                       | user2                       |
      | Primary Myer one member     | Additional Myer one member      |
#    Check Myer Visa application email or communication

  Scenario Outline: As Myer One App user, I want to apply VISA cards for primary Myer One members and new Additional Card holder
    Given As Myer One App user, I want to apply VISA cards for both primary Myer One members <user1> and <user2>
    When I validate that <user1> had been setup as Primary Card Holder
    And <user1> can confirm the tier of Myer one membership
    And I confirm that <user2> myer one account is created
    And I confirm that <user2> is an additional card holder
    Then I validate that <user2> had been setup as Secondary Card Holder
    And <user2> can confirm the tier of Myer one membership
    And I will get the following response:
      |welcomeMessage        | Your credit card application had been received |
    Examples:
      | user1                       | user2                       |
      | Primary Myer one member     | new user     |
    #    Check Myer One welcome email
#    Check Myer Visa application email or communication
  #   Check Myer Visa points for secondary/additional will be going to Primary

  Scenario Outline: As Myer One App user, I want to apply VISA cards for Additional Card holder and primary
    Given As Myer One App user, I want to apply VISA cards for both primary Myer One members <user1> and <user2>
    When I validate that <user2> had been setup as Primary Card Holder
    And <user2> can confirm the tier of Myer one membership
    Then I validate that <user1> had been setup as Secondary Card Holder
    And <user1> can confirm the tier of Myer one membership
    And I will get the following response:
      |welcomeMessage        | Your credit card application had been received |
    Examples:
      | user1                       | user2                       |
      | Additional Myer one member  | Primary Myer one member |
#    Check Myer Visa application email or communication
#  Check Myer Visa points for secondary/additional will be going to Primary

  #Possible scenario?
  Scenario Outline: As Myer One App user, I want to apply VISA cards for Additional Card holders and new primary
    Given As Myer One App user, I want to apply VISA cards for both primary Myer One members <user1> and <user2>
    And I confirm that <user2> myer one account is created
    When I validate that <user2> had been setup as Primary Card Holder
    And <user2> can confirm the tier of Myer one membership
    Then I validate that <user1> had been setup as Secondary Card Holder
    And <user1> can confirm the tier of Myer one membership
    And I will get the following response:
      |welcomeMessage        | Your credit card application had been received |
    Examples:
      | user1                       | user2                       |
      | Additional Myer one member  | new user |
#    Check Myer One welcome email for new user (primary)
#    Check Myer Visa application email or communication
#  Check Myer Visa points for secondary/additional will be going to Primary

  Scenario Outline: As Myer One App user, I want to apply VISA cards for either both primary Myer One members or both Additional Card holders
    Given As Myer One App user, I want to apply VISA cards for both primary Myer One members <user1> and <user2>
    When I validate that <user1> had been setup as Primary Card Holder
    And <user1> can confirm the tier of Myer one membership
    And I confirm that <user2> myer one account is created
    Then I validate that <user2> had been setup as Secondary Card Holder
    And <user2> can confirm the tier of Myer one membership
    And I will get the following response:
      |welcomeMessage        | Your credit card application had been received |
    Examples:
      | user1                       | user2                       |
      | Primary Myer one member  | new user |
#    Check Myer One welcome email for new user (primary)
#    Check Myer Visa application email or communication
#  Check Myer Visa points for secondary/additional will be going to Primary

  Scenario Outline: As Myer One App user, I want to apply VISA cards for new users
    Given As Myer One App user, I want to apply VISA cards for both primary Myer One members <user1> and <user2>
    And I confirm that <user1> myer one account is created
    When I validate that <user1> had been setup as Myer one Primary member
    Then I validate that <user1> had been setup as Primary Card Holder
    And I confirm that <user2> myer one account is created
    And I validate that <user2> had been setup as Additional Myer one member
    And I validate that <user2> had been setup as Secondary Card Holder
    And I will get the following response:
      |welcomeMessage        | Your credit card application had been received |
    Examples:
      | user1     | user2    |
      | new user  | new user |
#    Check Myer One welcome email for new user (primary)
#    Check Myer Visa application email or communication
#  Check Myer Visa points for secondary/additional will be going to Primary

  Scenario Outline: As Myer One App user, I want to apply VISA cards for either both primary Myer One members or both Additional Card holders
    Given As Myer One App user, I want to apply VISA cards for both primary Myer One members <user1> and <user2>
    And I validate that <user1> had been setup as Primary Card Holder
    And I validate that <user2> is not setup as Secondary Card Holder with the following message:
    And I will get the following response:
      |errorMessage        | Contact Customer Support to discuss Account|
  Examples:
  | user1                       | user2                       |
  | Primary Myer one member     | Primary Myer one member     |
  | Additional Myer one member  | Additional Myer one member  |

  Scenario Outline: As Myer One App user, I want to apply VISA cards for Myer One members who are not under the same account (unrelated)
    Given As Myer One App user, I want to apply VISA cards for both primary Myer One members <user1> and <user2>
    And I confirm that <user1> and <user2> is not under the same Account
    And I validate that <user1> had been setup as Primary Card Holder
    And I validate that <user2> is not setup as Secondary Card Holder with the following message:
      |errorMessage        | Contact Customer Support to discuss Account|
    Examples:
      | user1                       | user2                          |
      | Primary Myer one member     | Additional Myer one member     |
      | Additional Myer one member  | Primary Myer one member        |

  Scenario Outline: As Myer One App user, I want to apply VISA cards for a Additional Myer One member and a new member
    Given As Myer One App user, I want to apply VISA cards for a Myer One member <user1> and <user2>
    And I confirm that <user2> myer one account is created
    And I validate that <user1> had been setup as Primary Card Holder
    And I validate that <user2> is not setup as Secondary Card Holder with the following message:
      |errorMessage        | Contact Customer Support to discuss Account|
    Examples:
      | user1                       | user2    |
#      | Primary Myer one member     | new user |
      | Additional Myer one member  | new user |

  Scenario Outline: As Myer One App user, I want to apply VISA cards for a new member and additional Myer one member
    Given As Myer One App user, I want to apply VISA cards for a Myer One member <user1> and <user2>
    And I validate that the application will give the following message:
      |errorMessage        | Invalid Account|
    Examples:
      | user1     | user2    |
      | new user  | Additional Myer one member |

  Scenario Outline: As Myer One App user, I want to apply VISA cards for a primary with additional Myer one member and a new member
    Given As Myer One App user, I want to apply VISA cards for a Myer One member <user1> and <user2>
    And I validate that <user1> had been setup as Primary Card Holder
    And I confirm that <user2> myer one account is created
    And I validate that <user2> is not setup as Secondary Card Holder with the following message:
      |errorMessage        | Contact Customer Support to discuss Account|
    Examples:
      | user1                   | user2    |
      | Primary with Additional  | new user |

  Scenario Outline: As Myer One App user, I want to apply VISA cards for a new member and a primary with additional Myer one member
    Given As Myer One App user, I want to apply VISA cards for a Myer One member <user1> and <user2>
    And I validate that the application will give the following message:
      |errorMessage        | Invalid Account|
    Examples:
      | user1     | user2    |
      | new user  | Primary with Additional |

  Scenario Outline: As Myer One App user, I want to apply VISA cards for both additional Myer one members
    Given As Myer One App user, I want to apply VISA cards for a Myer One member <user1> and <user2>
    And I validate that the application will give the following message:
      |errorMessage        | Invalid Account|
    Examples:
      | user1       | user2      |
      | Additional  | Additional |