#En este feature encontramos tests relacionados al servicio de Shipping. 
#Scenario Verificar detalle de envíos: Se verifica el detalle de cada envío existente. 
@shipping @regression
Feature: Verificar servicio de Envios

  Background: 
    * url baseUrl
    * configure report = { showLog: true, showAllSteps: true }

  Scenario Outline: Verificar estado de los envíos
    Given path '/shipping/'+ <codigoEnvio>
    And request '<codigoEnvio>'
    When method GET
    And status 200
    And match response == { id: <codigoEnvio>, status: <estado> }

    Examples: 
      | codigoEnvio | estado       |
      | "a"         | "Delivered"  |
      | "b"         | "In transit" |
      | "c"         | "Preparing"  |
