
include "console.iol"
include "ServiceInterface.iol"

outputPort Service {
  Location: "socket://172.17.0.3:8000"
  Protocol: sodep
  Interfaces: ServiceInterface
}

main {
  rq.field1 = "test1";
  getContent@Service( rq )( response );
  println@Console( response.field2 )()
}
