@api
Feature: As Myer One App user, I want to make API calls for finding prices in different location/store

  @~api @login
Scenario: As Myer One App user, I want to make API calls for finding prices in different location/store
  Given I logged in as "Registered_User" through API call

  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
    And I will get the following response:
      |errorMessage        |Failed to find item with location:46 and barcode:8711000055380|
  Examples:
  | locationId  | barcode       |
  | 46        | 8711000055380 |

  @api1
  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
    And I will get the following response:
      |errorMessage        |Invalid location: or barcode:8711000055380 |
  Examples:
  | locationId  | barcode       |
  |             | 8711000055380 |

  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
    And I will get the following response:
      |errorMessage        |Invalid location:46 or barcode:|
    Examples:
      | locationId  | barcode       |
      | 46          |               |

  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
    And I will get the following response:
      |errorMessage        |Invalid location: or barcode: |
    Examples:
      | locationId  | barcode       |
      |             |               |

  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
    And I will get the following response:
      |errorMessage        |Invalid location:9999 or barcode:     |
    Examples:
      | locationId  | barcode       |
      |  9999       |               |

  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
    And I will get the following response:
      |errorMessage        |Failed to find item with location:9999 and barcode:3452345432524352       |
    Examples:
      | locationId  | barcode          |
      |  9999       | 3452345432524352 |

  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
    And I will get the following response:
      |errorMessage        |Failed to find item with location:XXXXXX and barcode:RTUIYTIT TUYO|
    Examples:
      | locationId  | barcode          |
      |  XXXXXX       | RTUIYTIT TUYO  |

  @api1
  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
    And I will get the following response:
      |locationId         |46             |
      |barcode            |6953665454135  |
      |retailPrice        |39.95           |
      |sellPrice          |11.99           |
      |shoppingCredits    |23.98           |
      |productName        |MICRODRY Contour Bat |
      |brand              |Microdry           |
      |productDescription |MICRODRY Contour Bath Matt:Deep Linen |
    Examples:
      | locationId  | barcode       |
      | 46        | 6953665454135 |

  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
    And I will get the following response:
      |locationId         |46             |
      |barcode            |3605532638270  |
      |retailPrice        |50           |
      |sellPrice          |50           |
      |shoppingCredits    |100          |
      |productName        |Lancome Rouge in Lov |
      |brand              |Lancome           |
      |productDescription |Lancome Rouge in Love 240M |
    Examples:
      | locationId  | barcode       |
      | 46        | 3605532638270 |

  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
    And I will get the following response:
      |locationId         |46             |
      |barcode            |3605532632308  |
      |brand              |Lancome   |
      |productName        |Lancome Renergie        |
      |productDescription |Lancome Renergie Mutiple Lift Tinted Moisturiser 01 40ml |
    And prices and shopping credits are returned as expected
    Examples:
      | locationId  | barcode       |
      | 46        | 3605532632308 |
#
#  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
#    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
#      |locationId         |46             |
#      |barcode            |3147758873016  |
#    And I will get the following response:
#      |locationId         |46             |
#      |barcode            |3147758873016  |
#      |brand              |Lancome                        |
#      |productName        |Lancome Artliner 1 N        |
#      |productDescription |Lancome Artliner 1 Noir|
#    And prices and shopping credits are returned as expected
#
#  Scenario Outline: As Myer One App user, I want to make API calls for finding prices in different location/store
#    Given As Myer One App user, I want to make a request for price finder based on <locationId> and <barcode>
#      |locationId         |46             |
#      |barcode            |0723763184342  |
#    And I will get the following response:
#      |locationId         |46             |
#      |barcode            |0723763184342  |
#      |brand              |Armani Exchange                       |
#      |productName        |ARMANI EXCHANGE AX20        |
#      |productDescription |ARMANI EXCHANGE AX2093 BANKS WATCH :Black:Large|
#    And prices and shopping credits are returned as expected


  Scenario: As Myer One App user, I want to make API calls for finding prices in different location/store
    Given As Myer One App user, I want to make a request to get all Myer Stores
    And I will get the following details of store position "13":
      |number      |1          |
      |name        |Melbourne  |
      |state       |VIC        |
      |address     |314 - 336 Bourke Street,Melbourne,3000,03 53206240 |
      |location    |{"lat"=>-37.8137911, "lng"=>144.9640081}           |
