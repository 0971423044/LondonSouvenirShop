## LONDON SOUVENIR WEBSITE 
e-commerce website for football

## Running the application locally

Config ```application.properties``` file:
```
spring.datasource.username=DB_USERNAME
spring.datasource.password=DB_PASSWORD
spring.datasource.url=jdbc:DB_TYPE://DB_HOST/DB_NAME
server.port=PORT
```

There are several ways to run a Spring Boot application on your local machine. One way is to execute the `main` method in the `DemoApplication` class from your IDE.

Alternatively you can use the [Spring Boot Maven plugin](https://docs.spring.io/spring-boot/docs/current/reference/html/build-tool-plugins-maven-plugin.html) like so:

```shell
mvn spring-boot:run
```

Import database from ```football.sql```. Using two default account:

- Admin account:
    - Username: london@sovenir.com
    - Password: 123456
- Member account:
    - Username: xuanxhaka@gmail.com
    - Password: 123456
    

To access url ```/admin``` to get admin pages.  
   


## Built with
- [Java Spring](https://spring.io/) - The web framework used
- [Maven](https://mvnrepository.com/) - Dependency Management

## Author
[Nghiem Van Xuan](https://github.com/0971423044)

