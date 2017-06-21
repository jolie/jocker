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
  if ( #args != 3 ) {
      println@Console( "Usage: jolie clientImageCreate.ol image_name tag repo")()
  } else {
    	with( rq ) {
          .fromImage = args[ 0 ];
          .tag = args[ 1 ];
          .repo = args[ 2 ]
      };
    	imageCreate@DockerIn(rq)(response);
    	valueToPrettyString@StringUtils( response )( s );
    	println@Console( s )()
  }
}
