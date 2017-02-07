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

  file.filename = "ClientBuild.tar";
	file.format = "binary";
	readFile@File(file)(rqImg.file);

  rqImg.t = "clienthello:latest";
  rqImg.dockerfile = "ClientBuild/Dockerfile";
	println@Console("***** BUILD IMAGE CLIENT *****")();
	build@DockerIn(rqImg)(response);

  rqCnt.name = "helloclient";
	rqCnt.Image = "clienthello";
	rqCnt.ExposedPorts.("9000/tcp") = obj.("{}");

	println@Console("***** CREATE "+rqCnt.name+" CONTAINER *****")();
	createContainer@DockerIn(rqCnt)(response);

  rqCli.id = "helloclient";
	println@Console("***** START " +rqCli.id+ " CONTAINER *****")();
	startContainer@DockerIn(rqCli)(response)

}
