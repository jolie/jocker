include "database.iol"
include "console.iol"
include "ServiceInterface.iol"

execution{ concurrent }

inputPort Service {
  Location: "socket://localhost:8000"
  Protocol: sodep
  Interfaces: ServiceInterface
}

include "dependencies.iol"

init {
  with( connectionInfo ) {
    .host = JDEP_DB_HOST;
    .driver = "postgresql";
    .port = 5432;
    .database= "test";
    .username = "postgres";
    .password = JDEP_DB_PASSWORD;
    .checkConnection = 1;
    .toLowerCase = true
  };
  connect@Database( connectionInfo )();
  println@Console("Connection done")()
}

main {
  getContent( request )( response ) {
      q = "SELECT field2 FROM testTable WHERE field1=:field1";
      q.field1 = request.field1;
      query@Database( q )( result );
      if ( #result.row > 0 ) {
          response.field2 = result.row.field2
      } else {
          throw( DataNotFound )
      }
  }
}
