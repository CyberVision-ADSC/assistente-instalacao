FROM openjdk:11
COPY ./cybervision_app.jar /cybervision_app.jar
ENTRYPOINT ["java","-jar","cybervision_app.jar"]
