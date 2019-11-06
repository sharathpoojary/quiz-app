FROM maven:3.5-jdk-8 AS build
COPY src /usr/employeeService/src
COPY pom.xml /usr/employeeService
RUN mvn -f /usr/employeeService/pom.xml clean package
EXPOSE 8080
ENTRYPOINT ["java","-Dspring.datasource.url=jdbc:mysql://mysqldb:3306/glarimy?useSSL=false&allowPublicKeyRetrieval=true","-jar","/usr/employeeService/target/employeeService-1.0.0.jar"]