#En este feature encontramos tests relacionados al servicio de Products. 
#Scenario Verificar lista de Productos: Se verifica y consulta la lista de productos existente. 
#Scenario Verificar detalle de producto: Se verifica el detalle de cada producto existente. 
@products @regression
Feature: Verificar servicio Products

  Background: 
    * url baseUrl
    * configure report = { showLog: true, showAllSteps: true }

  Scenario: Verificar lista de Productos
    Given path '/products'
    When method GET
    Then status 200

  Scenario Outline: Verificar detalle de producto
    Given path '/products/'+ <ProductCode>
    And request '<ProductCode>'
    When method GET
    And status 200
    And match response == { id: <ProductCode>, name: <ProductName> ,stock: '#ignore',description: '#ignore' }

    Examples: 
      | ProductCode | ProductName    |
      | "123"       | "Producto 123" |
      | "321"       | "Producto 321" |
      | "111"       | "Producto 111" |

  Scenario Outline: Verificar detalle de producto
    Given path '/products/', id
    And request id
    When method GET
    Then status 200
    And match response == { id: '#(id)', name: '#ignore',stock: '#ignore' ,description: '#ignore' }

    Examples: 
      | read('d_products.csv') |
