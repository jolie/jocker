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
	for( i = 0, i < #response.container, i++ ) {
        println@Console( "container " + response.container[ i ].Names + ", status: " + response.container[ i ].Status )();
        contains@StringUtils( response.container[ i ].Status { .substring = "Exited" } )( cont );
        if ( cont ) {
              println@Console( "Removing..." )();
              remove_rq.id = response.container[ i ].Id;
            	removeContainer@DockerIn( remove_rq )( remove_resp );
              println@Console( "Done!")()
        }
  }
}
