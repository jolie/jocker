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
	rq.all = true;
	containers@DockerIn(rq)(response);
	valueToPrettyString@StringUtils(response)(s);
	println@Console( s )()
}