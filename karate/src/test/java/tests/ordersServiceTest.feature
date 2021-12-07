#En este feature encontramos tests relacionados al servicio de Orders. 
#Scenario Crear Orden: Se verifica la creación de una nueva orden. 
@orders @regression
Feature: Verificar servicio de Ordenes

  Background: 
    * url baseUrl
    * configure report = { showLog: true, showAllSteps: true }

  Scenario: Crear Orden
    Given path '/orders'
    And request  ["123", "321", "111"]
    When method POST
    Then status 200
    And print response
