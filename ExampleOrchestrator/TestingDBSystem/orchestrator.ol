include "console.iol"
include "string_utils.iol"
include "file.iol"
include "database.iol"
include "time.iol"
include "exec.iol"
include "ServiceToTest/ServiceInterface.iol"

include "../../InterfaceAPI.iol"

outputPort ServiceToTest {
	Protocol: sodep
	Interfaces: ServiceInterface
}

outputPort DockerIn {
	Location: "socket://localhost:8008"
	Protocol: sodep
	Interfaces: InterfaceAPI
}

define _firstDBConnection {
	scope( connection ) {
		install( ConnectionError =>
				connectionAttempt++;
				if ( connectionAttempt > 3 ) {
						throw( ConncetionError )
				} else {
					  println@Console("Attempt " + connectionAttempt + " to connect to db...")();
						sleep@Time( connectionAttempt * 1500 )();
						_firstDBConnection
				}
	  );
		with( connectionInfo ) {
			.host = postgresql_host;
			.driver = "postgresql";
			.port = 5432;
			.database= "postgres";
			.username = "postgres";
			.password = "password";
			.checkConnection = 1;
			.toLowerCase = true
		};
		connect@Database( connectionInfo )()
	}
}

define _createPostgresqlContainer {
		rqCnt.name = "ppstgresqlCnt";
		rqCnt.Image = "postgres:9.0";
		rqCnt.ExposedPorts.("5432/tcp") = obj.("{}");
		rqCnt.Env[0] = "POSTGRES_PASSWORD=password";
		createContainer@DockerIn( rqCnt )( response );
		println@Console( "Done, container Id " + response.Id )();
		container_id = response.Id
}

main {
  /* pulling postgresql image */
  println@Console("Pulling postgresql image...")();
  IMAGE_NAME = "postgres";
  with( rq ) {
      .fromImage = IMAGE_NAME;
      .tag = "9.0";
      .repo = "-"
  };
  imageCreate@DockerIn( rq )( response );
  println@Console("Done")();
  println@Console("Creating container...")();
  /* create a container from psql image */
	scope( create ) {
			install( Conflict =>
					println@Console("The container already exists, trying to remove it...")();
					cntrq.id = "ppstgresqlCnt";
					scope( stop ) {
							install( AlreadyStopped => nullProcess );
							stopContainer@DockerIn( cntrq )()
					};
					removeContainer@DockerIn( cntrq )( response );
					println@Console("removed")();
					_createPostgresqlContainer
		  );
			_createPostgresqlContainer
	}
	;

	/* starting postgresql container */
	print@Console("starting container...")();
	crq.id = "ppstgresqlCnt";
	startContainer@DockerIn( crq )( response );
	println@Console("Done")()
	;
	/* get info about the container */
	with( info ) {
			.filters.id = container_id
	};
	containers@DockerIn( info )( container_info );
	postgresql_host = container_info.container[ 0 ].NetworkSettings.Networks.bridge.IPAddress;

	/* connection with the DB and preparation of the tables */
	_firstDBConnection;
	println@Console("First connection done")()
	;
	q = "CREATE DATABASE test";
	update@Database( q )();
	close@Database()();
	with( connectionInfo ) {
		.host = postgresql_host;
		.driver = "postgresql";
		.port = 5432;
		.database= "test";
		.username = "postgres";
		.password = "password";
		.checkConnection = 1;
		.toLowerCase = true
	};
	connect@Database( connectionInfo )();
	println@Console("connected with database test")();

	q = "CREATE TABLE testTable
	(
	  field1 character varying,
	  field2 character varying
	)";
	update@Database( q )();
	println@Console("Created table")()
	;
	/* preparing data for tests */
	print@Console("Initializing db data...")();
	q = "INSERT INTO testTable ( field1, field2 ) VALUES ( :field1, :field2 )";
	q.field1 = "test1";
	q.field2 = "test2";
	update@Database( q )();
	println@Console("Done")();
	close@Database()();

	/* creating container image of the microservice connected with the database */
	print@Console("Creating image container of the service to test...")();
	freshname = new;
	mkdir@File( freshname )();
	copyDir@File( { .to=freshname, .from="ServiceToTest" } )();
	file.filename = freshname + "/Dockerfile";
	file.content = "FROM jolielang/jolie-docker-deployer\n
	EXPOSE 8000\n
	COPY " + freshname + "/main.ol main.ol\n
	COPY " + freshname + "/ServiceInterface.iol ServiceInterface.iol\n
	COPY " + freshname + "/lib lib\n";
	writeFile@File( file )();
	ex_rq = "tar";
	ex_rq.args[ 0 ] = "-cvf";
	ex_rq.args[ 1 ] = freshname + ".tar";
	ex_rq.args[ 2 ] = freshname;
	ex_rq.waitFor = 1;
	exec@Exec( ex_rq )();
	deleteDir@File( freshname )();

	undef( file ); undef( rq );
	file.filename = freshname + ".tar";
	file.format = "binary";
	readFile@File( file )( rq.file );
	rq.t = "servicetotest:latest";
	rq.dockerfile = freshname + "/Dockerfile";
	build@DockerIn( rq )( response );
	delete@File( freshname + ".tar" )();
	println@Console("Done")();

	/* running jolie service container */
	print@Console("creating container...")();
	undef( rqCnt );
	rqCnt.name = freshname;
	rqCnt.Image = "servicetotest:latest";
	rqCnt.ExposedPorts.("8000/tcp") = obj.("{}");
	rqCnt.Env[0] = "JDEP_DB_HOST=" + postgresql_host;
	rqCnt.Env[1] = "JDEP_DB_PASSWORD=password";
	createContainer@DockerIn( rqCnt )( response );
	println@Console( "Done, container Id " + response.Id )();
	container_jolietotest_id = response.Id;

	print@Console("starting container...")();
	crq.id = freshname;
	startContainer@DockerIn( crq )( response );
	println@Console("Done")();

	with( info ) {
			.filters.id = container_jolietotest_id
	};
	containers@DockerIn( info )( container_info );
	jolie_to_test_host = container_info.container[ 0 ].NetworkSettings.Networks.bridge.IPAddress;

	/* performing test */
	sleep@Time( 2000 )();
	print@Console( "Performing Test..." )();
	ServiceToTest.location = "socket://" + jolie_to_test_host + ":8000";
	println@Console( ServiceToTest.location )();
	test_rq.field1 = "test1";
	attempt = 0; connection = false;
	while( attempt < 5 && !connection ) {
			println@Console( "Attempt to connect " + attempt )();
		  scope( connection_to_jolie ) {
					install( IOException => attempt++ );
					getContent@ServiceToTest( test_rq )( test_rs );
					sleep@Time( 2000 )();
					connection = true
			}
	};
	if ( !connection ) {
		println@Console("Error in connection with Jolie to test service")();
		throw( TestError )
	}
	;
	if ( test_rs.field2 != "test2" ) {
		println@Console( "ERROR" )();
		println@Console( "Expected test2, found " + test_rs.field2 )();
		throw( TestError )
	} else {
		println@Console("OK")();
		println@Console("Removing test containers and images")()
	}
	;
	undef( crq );
	print@Console("stopping jolie to test container...")();
	crq.id = freshname;
	stopContainer@DockerIn( crq )( response );
	println@Console("Done")();

	undef( crq );
	print@Console("removing jolie to test container...")();
	crq.id = freshname;
	removeContainer@DockerIn( crq )( response );
	println@Console("Done")();

	undef( crq );
	print@Console("removing jolie to test image...")();
	crq.name = "servicetotest";
	removeImage@DockerIn( crq )( response );
	println@Console("Done")();

	undef( crq );
	print@Console("stopping postgresql container...")();
	crq.id = "ppstgresqlCnt";
	stopContainer@DockerIn( crq )( response );
	println@Console("Done")();

	undef( crq );
	print@Console("removing postgresqlcontainer...")();
	crq.id = "ppstgresqlCnt";
	removeContainer@DockerIn( crq )( response );
	println@Console("Done")()

}
