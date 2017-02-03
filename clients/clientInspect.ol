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
	rq.id = "myFirstCtn2";
	rq.size = true;
	println@Console("***** INSPECT "+ rq.id +" CONTAINER *****")();
	inspect@DockerIn(rq)(response);
	valueToPrettyString@StringUtils(response)(s);
	println@Console( s )()
}
