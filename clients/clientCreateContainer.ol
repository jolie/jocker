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
	// * Creating a container object that represent the container you want to create and send to Docker. !REQUIRED!
  rqCnt.name = "helloserver";
	// *** specifying the image of the container you want to create, if not the image is <none>
	rqCnt.Image = "nginx";
	// *** specifying the port you want to expose for the container
	rqCnt.ExposedPorts.("9000/tcp") = obj.("{}");
	// ****** specifying the ports binding about this container; if you want comunicate to external client
	rqCnt.HostConfig.PortBindings.("9000/tcp")._.HostIp = "192.168.99.100";
	rqCnt.HostConfig.PortBindings.("9000/tcp")._.HostPort = "9000";
	println@Console("***** CREATE CONTAINER *****")();
	createContainer@DockerIn(rqCnt)(response);
	valueToPrettyString@StringUtils( response )( s );
	println@Console( s )()
}
