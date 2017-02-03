# Jocker
The Jolie Docker Orchestrator (work to commence soon).

This Orchestrator allow us to contact docker API trought Jolie language:
Users are able to launch many of the most important API Docker in Jolie like building images, create containers, starting container, inspect volume, networks and much more.

Thanks to this it's possible to create some orchestrators that work managing Docker's API. 

## Interface.iol

Into this file are specified all possible data-types that define Request and Response operations. The intent of this interface is to recreate the model of any API docker, either in the request and in response. 

## dockerAPI.ol

Here we find the declaretion of all operations present in the Interface. Trought the output port we handle the comunication with Docker and inside each operation we have a response by docker that it will be translated and sended to the client.
The output port describe, for each operation, alias, method and format of http calls, to recreate the original like POST,GET,DELETE... action/path_parameters?query_parameter in json format. There's also a fault handling that checks the status code given to us by docker to catch errors that occur during the execution.

