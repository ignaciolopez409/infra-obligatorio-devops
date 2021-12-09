

<h1>
    <p align="center">
        <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.bGK6rcji35qmU55K95BeQwHaE8%26pid%3DApi&f=1"
             alt="Logo" width="140" height="110">
        <br>Obligatorio [Curso Devops]
</h1>
<p align="center">
    Repositorio de Devops
    <br/>
</p>

![made-with-python](https://img.shields.io/badge/CICD-GitHub%20Actions-brightgreen)

![made-with-python](https://img.shields.io/badge/Terraform-skyblue)

![made-with-python](https://img.shields.io/badge/Helm-skyblue)

![made-with-python](https://img.shields.io/badge/Cucumber-skyblue)

<p align="center">
  <a href="#Resumen">Resumen</a> •
  <a href="#CI">CI</a> •
  <a href="#CD">CD</a> •
  <a href="#Microservicios">Microservicios</a> •
  <a href="#Infraestructura">Infraestructura</a> •
  <a href="#QA_Automation">QA Automation</a> •
  <a href="#Ejecutar">Ejecutar</a>
</p>  


<p align="center">

## Resumen

Nuestro entorno tiene 4 microservicios y cuenta con 3 ambientes.
Para lograr el CICD utilizamos principalmente la herramienta de Github Actions. Nuestras tres principales ramas despliegan automáticamente en su ambiente homónimo. 

CI

Para el ciclo de integración se corren tests unitarios y se hace un análisis del código con la plataforma de sonarcube.io. Por cuestiones de la Community Edition solamente podemos correr análisis sobre la rama por defecto, dado esto por razones de practicidad esta rama es develop.

Para empaquetar y liberar los microservicios utlizamos Maven. Nos apoyamos principalmente en el plugin de release más utilizado e implementamos el plugin Jib que se encarga de crear imágenes docker basados en estándares teniendo en cuenta el lifecycle de Maven, autentica contra el registry DockerHub y pushea la imagen con su respectivo tag. 

Una vez terminado este proceso, actualizamos sobre el repositorio de Devops el valor de la versión en su respectivo ambiente y pusheamos un cambio para ejecutar el CD

CD

En la plataforma de EKS vamos a tener nuestros tres ambientes

- production
- test
- develop



