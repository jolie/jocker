include "console.iol"
include "string_utils.iol"
include "json_utils.iol"

include "../InterfaceAPI.iol"

outputPort DockerIn {
	Location: "socket://localhost:8008"
	Protocol: sodep
	Interfaces: InterfaceAPI
}

main {

	rq.id="web";
	println@Console("***** LIST RUN PROCESSES OF "+ rq.id +" CONTAINER *****")();
	listRunProcesses@DockerIn(rq)(response);
	valueToPrettyString@StringUtils(response)(s);
	println@Console( s )()
}