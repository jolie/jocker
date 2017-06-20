include "console.iol"
include "string_utils.iol"
include "json_utils.iol"
include "file.iol"

include "../InterfaceAPI.iol"

outputPort DockerIn {
	Location: "socket://localhost:8008"
	Protocol: sodep
	Interfaces: InterfaceAPI
}

main {
	file.filename = "TestingBuild.tar";
	file.format = "binary";
	readFile@File(file)(rq.file);

	rq.t = "prova:latest";
	rq.dockerfile = "TestingBuild/Dockerfile";
	println@Console("***** BUILD IMAGE *****")();
	build@DockerIn(rq)(response);
	valueToPrettyString@StringUtils( response )( s );
	println@Console( s )()
}
