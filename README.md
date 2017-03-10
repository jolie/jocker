# Jocker
The Jolie Docker Orchestrator (work to commence soon).

## Let's take a look..

This Orchestrator allow us to contact docker API trought Jolie language:
Users are able to launch many of the most important API Docker in Jolie like building images, create containers, starting container, inspect volume, networks and much more.

Thanks to this it's possible to create some orchestrators that work managing Docker's API.

### Interface.iol

Into this file are specified all possible data-types that define Request and Response operations. The intent of this interface is to recreate the model of any API docker, either in the request and in response.

### dockerAPI.ol

Here we find the declaretion of all operations present in the Interface. Trought the output port we handle the comunication with Docker and inside each operation we have a response by docker that it will be translated and sended to the client.
The output port describe, for each operation, alias, method and format of http calls, to recreate the original like POST,GET,DELETE... action/path_parameters?query_parameter in json format. There's also a fault handling that checks the status code given to us by docker to catch errors that occur during the execution.

### Exemples - client directory

Into this directory we found all client request to each created API docker. Inside each file .ol there's an example of a request that it's send to docker and ask to it to do an operation like create container, build images, remove volumes and much more.

## How-to

The scope is to give the right technology to deploy microservices, the possibility to create orchestrators for their own needs. Simply downloading dockerAPI.ol and InterfaceAPI.ol you get Jocker's heart. After this, you can create Jolie orchestrator by binding this to dockerAPI.ol and nothing else.
Jocker will do the requests to Docker without your managing. In your orchestrator you can call API docker for your endings and you can create also routinary procedures to deploying microservices.
