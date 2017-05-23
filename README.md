## Overview

Sample application to illustrate the usage of a JEE micro service running on a docker container connecting to another docker container hosting a database server.



## Docker container hosting the JEE application
  This is the JEE docker container running one more instances of simple Springboot REST service and an embedded activiti engine. 


## Docker container hosting the Database server
  This is docker container hosts a database server, MySql in this instance, providing the schema for activiti workflow processes.

### Docker configuration for MySql database

#### Starting the MySql docker container using maven
       
        mvn docker:start

This starts up a new instance of MySql Server. Confirm this by checking the processes running on docker.
        
        docker ps -a
 
And you should see process similar to the following:

        CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
        b9171c900ed4        mysql:5.7           "docker-entrypoint"   19 minutes ago      Up 13 minutes       0.0.0.0:3306->3306/tcp   activiti-db
        
     
#### Starting the MySql docker container using docker-compose
        docker-compose up -d

Once the docker compose is successfully executed, your docker mysql container should be up and running
  
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
    81ed22e7be66        mysql               "docker-entrypoint..."   3 days ago          Up 32 minutes       0.0.0.0:3306->3306/tcp   database.dev
    
### Building and publishing custom MySql image with Activiti database
docker build -t mysql-with-activiti .

Check if the images is created succesfully  and tag the image

        docker images

        docker tag mysql-with-activiti pioneerlabsio/mysql-with-activiti

Test the tagged image locally before publishing to docker hub
        
        docker run --name=activitidb -e MYSQL_DATABASE='activiti' -e MYSQL_USER='test' -e MYSQL_PASSWORD='test' -e MYSQL_ROOT_PASSWORD='root' -p 3306:3306 -t pioneerlabsio/mysql-with-activiti

Use your favourite mysql client and connect to the docker mysql process using the following details:

        host: 0.0.0.0
        port: 3306
        user: test
        password: test

You should see a new database with all the Activiti tables.

Now push the image to the docker hub
    
        docker push pioneerlabsio/mysql-with-activiti
        
      