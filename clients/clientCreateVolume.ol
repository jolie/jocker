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
  rq.Name = "Vol2";
	println@Console("***** CREATE "+ rq.Name +" VOLUME *****")();
	createVolume@DockerIn(rq)(response);
	valueToPrettyString@StringUtils( response )( s );
	println@Console( s )()
}
