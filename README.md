## Overview

Sample application to illustrate the usage of a JEE micro service running on a docker container connecting to another docker container hosting a database server.



## Docker container hosting the JEE application
  This is the JEE docker container running one more instances of simple Springboot REST service and an embedded activiti engine. 


## Docker container hosting the Database server
  This is docker container hosts a database server, MySql in this instance, providing the schema for activiti workflow processes.

### Docker configuration for MySql database

#### Starting the MySql docker container
       
        mvn docker:start

This starts up a new instance of MySql Server. Confirm this by checking the processing running on docker.
        
        docker ps -a
 
And you should see process similar to the following:

        CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
        b9171c900ed4        mysql:5.7           "docker-entrypoint"   19 minutes ago      Up 13 minutes       0.0.0.0:3306->3306/tcp   activiti-db
        
     
 