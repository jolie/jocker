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
	images@DockerIn()( response );
	for( i = 0, i < #response.images, i++ ) {
        println@Console( "image " + response.images[ i ].Id )();
        println@Console( "Removing..." )();
        rq.name = response.images[ i ].Id;
				rq.force = true;
        removeImage@DockerIn(rq)( remove_response );
        println@Console( "Done!")()
  }
}
