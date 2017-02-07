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
	rq.name = "myFirstCtn3";
	rq.Image = "nginx";
	rq.ExposedPorts.("9000/tcp") = obj.("{}");
	println@Console("***** CREATE CONTAINER *****")();
	createContainer@DockerIn(rq)(response);
	valueToPrettyString@StringUtils( response )( s );
	println@Console( s )()
}
