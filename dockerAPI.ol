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
    .osc.listRunProcesses.method.queryFormat = "json";
    .osc.logs.alias = "containers/%!{id}/logs";
    .osc.logs.method = "get";
    .osc.logs.method.queryFormat = "json";
    .osc.images.alias = "images/json";
    .osc.images.method = "get";
    .osc.images.method.queryFormat = "json"
  }
  RequestResponse: containers, inspect, listRunProcesses, logs, images
}

main {
  [containers(request)(response){
    if(!is_defined(request.all)){
      request.all = false
    };
    if(!is_defined(request.size)){
      request.size = false
    };
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
    if(!is_defined(request.ps_args)){
      request.ps_args="-ef"
    };
    listRunProcesses@DockerD(request)(responseByDocker);
    response.Titles<<responseByDocker.Titles;
    response.Processes.row<<responseByDocker.Processes._;
    valueToPrettyString@StringUtils( response )( s );
    println@Console(s)()
  }]
  [logs(request)(response){
    if(!is_defined(request.follow)){
      request.follow = false
    };
    if(!is_defined(request.stderr)){
      request.stderr = false
    };
    if(!is_defined(request.stdout)){
      request.stdout = false
    };
    if(!is_defined(request.since)){
      request.since = 0
    };
    if(!is_defined(request.timestamps)){
      request.timestamps = false
    };
    if(!is_defined(request.tail)){
      request.tail = "all"
    };
    logs@DockerD(request)(responseByDocker);
    response.log<<responseByDocker;
    valueToPrettyString@StringUtils( response )( s );
    println@Console(s)()
  }]
  [images(request)(response){
    if(!is_defined(request.all)){
      request.all = false
    };
    if(!is_defined(request.digest)){
      request.digest = false
    };
    images@DockerD(request)(responseByDocker);
    response.images<<responseByDocker._;
    valueToPrettyString@StringUtils( response )( s );
    println@Console(s)()
  }]
}