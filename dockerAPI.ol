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
    .osc.containers.method.queryFormat = "json";
    .osc.inspect.alias = "containers/%!{id}/json";
    .osc.inspect.method = "get";
    .osc.inspect.method.queryFormat = "json";
    .osc.listRunProcesses.alias = "containers/%!{id}/top";
    .osc.listRunProcesses.method = "get";
    .osc.listRunProcesses.method.queryFormat = "json"
  }
  RequestResponse: containers, inspect, listRunProcesses
}

main {
  [containers(request)(response){
    containers@DockerD(request)(responseByDocker);
    response.container<<responseByDocker._;
    valueToPrettyString@StringUtils( response )( s );
    println@Console(s)()
  }]
  [inspect(request)(response){
    inspect@DockerD(request)(responseByDocker);
    response<<responseByDocker;
    valueToPrettyString@StringUtils( response )( s );
    println@Console(s)()
  }]
  [listRunProcesses(request)(response){
    if(request.ps_args==""){
      request.ps_args="-ef"
    };
    listRunProcesses@DockerD(request)(responseByDocker);
    response.Titles<<responseByDocker.Titles;
    response.Processes.row<<responseByDocker.Processes._;
    valueToPrettyString@StringUtils( response )( s );
    println@Console(s)()
  }]
}