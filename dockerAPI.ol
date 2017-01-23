include "console.iol"
include "string_utils.iol"
include "json_utils.iol"

include "InterfaceAPI.iol"

inputPort DockerIn {
	Location: "socket://localhost:8008"
	Protocol: sodep
	Interfaces: InterfaceAPI
}

outputPort DockerD {
  Location: "socket://192.168.99.100:2357"
  Protocol: http {
    .debug=1;
    .osc.containers.alias = "containers/json";
    .osc.containers.method = "get";
    .osc.containers.method.queryFormat = "json"
    // .osc.inspect.alias = "containers/%!{id}/json";
    // .osc.inspect.method = "get";
    // .osc.inspect.method.queryFormat = "json"
  }
  RequestResponse: containers
}

main {
  [containers(request)(response){
    println@Console("***** RETURN THE LIST OF ALL CONTAINER *****")();
    containers@DockerD(request)(responseByDocker);
    response.container<<responseByDocker._;
    valueToPrettyString@StringUtils( response )( s );
    println@Console(s)()
    // response<<responseByDocker
  }]
  // [inspect(request)(response){
    
  // }]
}