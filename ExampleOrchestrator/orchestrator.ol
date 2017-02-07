include "console.iol"
include "string_utils.iol"
include "json_utils.iol"
include "file.iol"

include "InterfaceAPI.iol"

outputPort DockerIn {
	Location: "socket://localhost:8008"
	Protocol: sodep
	Interfaces: InterfaceAPI
}


main {
	// * Loading file tar and prepare to build
  file.filename = "TestingBuild.tar";
	file.format = "binary";
	// *** build tar file
	readFile@File(file)(rqImg.file);

	// * Creating a image object that represent the image you want to create and send to Docker.
	// *** the format <name>:<tag> of the image !REQUIRED!
  rqImg.t = "serverhello:latest";
	// *** specifying the path of your Dockerfile, if not the path is /Dockerfile
	rqImg.dockerfile = "TestingBuild/Dockerfile";
	println@Console("***** BUILD IMAGE SERVER *****")();
	// send it to Docker
	build@DockerIn(rqImg)(response);

	// * Creating a container object that represent the container you want to create and send to Docker. !REQUIRED!
  rqCnt.name = "helloserver";
	// *** specifying the image of the container you want to create, if not the image is <none>
	rqCnt.Image = "serverhello";
	// *** specifying the port you want to expose for the container
	rqCnt.ExposedPorts.("9000/tcp") = obj.("{}");

	// ****** specifying the ports binding about this container; if you want comunicate to external client
	rqCnt.HostConfig.PortBindings.("9000/tcp")._.HostIp = "192.168.99.100";
	rqCnt.HostConfig.PortBindings.("9000/tcp")._.HostPort = "9000";

	println@Console("***** CREATE "+rqCnt.name+" CONTAINER *****")();
	// send it to Docker
	createContainer@DockerIn(rqCnt)(response);

	// * Inspect the container already created to verify settings
	// *** the id or name of the container you want to inspect !REQUIRED!
	rqIns.id = "helloserver";
	println@Console("***** INSPECT "+rqCnt.name+" CONTAINER *****")();
	inspect@DockerIn(rqIns)(responseC);
	valueToPrettyString@StringUtils( responseC )( s );
	println@Console( s )();

  rqSer.id = "helloserver";
	println@Console("***** START " +rqSer.id+ " CONTAINER *****")();
	startContainer@DockerIn(rqSer)(response)

}
