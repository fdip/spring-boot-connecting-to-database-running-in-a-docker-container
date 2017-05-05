## Overview

Sample application to illustrate the usage of a JEE micro service running on a docker container connecting to another docker container hosting a database server.



## Docker container hosting the JEE application
  This is the JEE docker container running one more instances of simple Springboot REST service and an embedded activiti engine. 


## Docker container hosting the Database server
  This is docker container hosts a database server, MySql in this instance, providing the schema for activiti workflow processes.

### Docker configuration for MySql database


