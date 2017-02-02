include "console.iol"
include "string_utils.iol"
include "json_utils.iol"

outputPort Output {
	Location: "socket://localhost:9000"
	Protocol: sodep
}

main {

	println@Console( "*** HELLO THIS IS MY FIRST BUILD IMAGE ***" )()
}
