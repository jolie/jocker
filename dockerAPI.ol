include "console.iol"
include "string_utils.iol"
include "json_utils.iol"

include "InterfaceAPI.iol"

inputPort DockerIn {
	Location: "socket://localhost:8008"
	Protocol: sodep
	Interfaces: InterfaceAPI
}

outputPort DockerD {
  Location: "socket://192.168.99.100:2357"
  Protocol: http {
		.responseHeaders="@header";
    .debug=1;
    .debug.showContent=1;
    .format->format;
    .contentType->contentType;
    .statusCode->statusCode;
    .osc.containers.alias = "containers/json";
    .osc.containers.method = "get";
    .osc.containers.method.queryFormat = "json";
    .osc.inspect.alias = "containers/%!{id}/json";
    .osc.inspect.method = "get";
    .osc.inspect.method.queryFormat = "json";
    .osc.listRunProcesses.alias = "containers/%!{id}/top";
    .osc.listRunProcesses.method = "get";
    .osc.listRunProcesses.method.queryFormat = "json";
    .osc.logs.alias = "containers/%!{id}/logs";
    .osc.logs.method = "get";
    .osc.logs.method.queryFormat = "json";
    .osc.images.alias = "images/json";
    .osc.images.method = "get";
    .osc.images.method.queryFormat = "json";
    .osc.inspectImage.alias = "images/%!{name}/json";
    .osc.inspectImage.method = "get";
    .osc.inspectImage.method.queryFormat = "json";
    .osc.imageHistory.alias = "images/%!{name}/history";
    .osc.imageHistory.method = "get";
    .osc.imageHistory.method.queryFormat = "json";
    .osc.imageSearch.alias = "images/search";
    .osc.imageSearch.method = "get";
    .osc.imageSearch.method.queryFormat = "json";
    .osc.removeImage.alias = "images/%!{name}?force=%!{force}&noprune=%!{noprune}";
    .osc.removeImage.method = "delete";
    .osc.removeImage.method.queryFormat = "json";
    .osc.exportImage.alias = "images/%!{name}/get";
    .osc.exportImage.method = "get";
    .osc.exportImage.method.queryFormat = "json";
    .osc.changesOnCtn.alias = "containers/%!{id}/changes";
    .osc.changesOnCtn.method = "get";
    .osc.changesOnCtn.method.queryFormat = "json";
    .osc.exportContainer.alias = "containers/%!{id}/export";
    .osc.exportContainer.method = "get";
    .osc.exportContainer.method.queryFormat = "json";
    .osc.statsContainer.alias = "containers/%!{id}/stats";
    .osc.statsContainer.method = "get";
    .osc.statsContainer.method.queryFormat = "json";
    .osc.networks.alias = "networks";
    .osc.networks.method = "get";
    .osc.networks.method.queryFormat = "json";
    .osc.inspectNetwork.alias = "networks/%!{id}";
    .osc.inspectNetwork.method = "get";
    .osc.inspectNetwork.method.queryFormat = "json";
    .osc.volumes.alias = "volumes";
    .osc.volumes.method = "get";
    .osc.volumes.method.queryFormat = "json";
    .osc.inspectVolume.alias = "volumes/%!{name}";
    .osc.inspectVolume.method = "get";
    .osc.inspectVolume.method.queryFormat = "json";
    .osc.createContainer.alias = "containers/create?name=%!{name}";
    .osc.createContainer.method = "post";
    .osc.createContainer.method.queryFormat = "json";
    .osc.startContainer.alias = "containers/%!{id}/start";
    .osc.startContainer.method = "post";
    .osc.startContainer.method.queryFormat = "json";
    .osc.renameContainer.alias = "containers/%!{id}/rename?name=%!{name}";
    .osc.renameContainer.method = "post";
    .osc.renameContainer.method.queryFormat = "json";
    .osc.stopContainer.alias = "containers/%!{id}/stop";
    .osc.stopContainer.method = "post";
    .osc.stopContainer.method.queryFormat = "json";
    .osc.removeContainer.alias = "containers/%!{id}";
    .osc.removeContainer.method = "delete";
    .osc.removeContainer.method.queryFormat = "json";
    .osc.restartContainer.alias = "containers/%!{id}/restart";
    .osc.restartContainer.method = "post";
    .osc.restartContainer.method.queryFormat = "json";
    .osc.createVolume.alias = "volumes/create";
    .osc.createVolume.method = "post";
    .osc.createVolume.method.queryFormat = "json";
    .osc.removeVolume.alias = "volumes/%!{name}?force=%!{force}";
    .osc.removeVolume.method = "delete";
    .osc.removeVolume.method.queryFormat = "json";
    .osc.removeNetwork.alias = "networks/%!{id}";
    .osc.removeNetwork.method = "delete";
    .osc.removeNetwork.method.queryFormat = "json";
    .osc.createNetwork.alias = "networks/create";
    .osc.createNetwork.method = "post";
    .osc.createNetwork.method.queryFormat = "json";
    .osc.killContainer.alias = "containers/%!{id}/kill";
    .osc.killContainer.method = "post";
    .osc.killContainer.method.queryFormat = "json";
    .osc.pauseContainer.alias = "containers/%!{id}/pause";
    .osc.pauseContainer.method = "post";
    .osc.pauseContainer.method.queryFormat = "json";
    .osc.unpauseContainer.alias = "containers/%!{id}/unpause";
    .osc.unpauseContainer.method = "post";
    .osc.unpauseContainer.method.queryFormat = "json";
    .osc.waitContainer.alias = "containers/%!{id}/wait";
    .osc.waitContainer.method = "post";
    .osc.waitContainer.method.queryFormat = "json";
    .osc.deleteStopContainers.alias = "containers/prune";
    .osc.deleteStopContainers.method = "post";
    .osc.deleteStopContainers.method.queryFormat = "json";
    .osc.createExec.alias = "containers/%!{id}/exec";
    .osc.createExec.method = "post";
    .osc.createExec.method.queryFormat = "json";
    .osc.build.alias = "build?q=%!{q}&nocache=%!{nocache}&rm=%!{rm}&forcerm=%!{forcerm}&t=%!{t}&dockerfile=%!{dockerfile}";
    .osc.build.method = "post";
    .osc.build.method.queryFormat = "json"
  }
  RequestResponse:
	build,
	changesOnCtn,
	containers,
	createContainer,
	createExec,
	createNetwork,
	createVolume,
	deleteStopContainers,
	exportContainer,
	exportImage,
	images,
	imageHistory,
	imageSearch,
	inspect,
	inspectImage,
	inspectNetwork,
	inspectVolume,
	killContainer,
	listRunProcesses,
	logs,
	networks,
	pauseContainer,
	removeContainer,
	removeImage,
	removeNetwork,
	removeVolume,
	renameContainer,
	restartContainer,
	startContainer,
	statsContainer,
	stopContainer,
	unpauseContainer,
	volumes,
	waitContainer
}

execution{ concurrent }

init {
	format = "json";
	contentType = "application/json"
}

main {

	[ build( request )( response ){
		scope( build )
		{
			install( serverError => println@Console("Internal server error")() );
			install( badParam => println@Console("Bad parameter")() );
			install( default => nullProcess );
			format = "binary";
			contentType = "application/tar";
			if( !(is_defined( request.dockerfile ))){
	      request.dockerfile = "Dockerfile"
	    };
			if( !(is_defined( request.q ))){
	      request.q = false
	    };
			if( !(is_defined( request.nocache ))){
	      request.nocache = false
	    };
			if( !(is_defined( request.rm ))){
	      request.rm = true
	    };
			if( !(is_defined( request.forcerm ))){
	      request.forcerm = false
	    };
			if( !(is_defined( request.t ))){
				request.t = "<none>:latest"
	    };
			request = request.file;
			undef( request.file );
			build@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 400 )
			{
				throw( badParam )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
	}]


	[ changesOnCtn( request )( response ){
		scope( changesOnCtn )
		{
			install( noSuch => println@Console("No such container")() );
			install( serverError => println@Console("Internal server error")() );
			changesOnCtn@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.changes<<responseByDocker._
			}
		}
	}]


	[ containers( request )( response ) {
		scope( containers )
		{
			install( serverError => println@Console("Internal server error")() );
			install( badParam => println@Console("Bad parameter")() );
			if( !(is_defined( request.all ))){
	      request.all = false
	    };
	    if( !(is_defined( request.size ))){
	      request.size = false
	    };
	    containers@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 400 )
			{
				throw( badParam )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.container<<responseByDocker._
			}
		}
  }]


	[ createContainer( request )( response ){
		scope( createContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( badParam => println@Console("Bad parameter")() );
			install( noSuch => println@Console("No such container")() );
			install( noAttach => println@Console("Impossible to Attach")() );
			install( conflict => println@Console("Conflict")() );
			if( !(is_defined( request.AttachStdin ))){
	      request.AttachStdin = false
	    };
	    if( !(is_defined( request.AttachStdout ))){
	      request.AttachStdout = true
	    };
	    if( !(is_defined( request.AttachStderr ))){
	      request.AttachStderr = true
	    };
	    if( !(is_defined( request.OpenStdin ))){
	      request.OpenStdin = false
	    };
	    if( !(is_defined( request.StdinOnce ))){
	      request.StdinOnce = false
	    };
	    if( !(is_defined( request.NetworkDisabled ))){
	      request.NetworkDisabled = false
	    };
	    if( !(is_defined( request.StopSignal ))){
	      request.StopSignal = "SIGTERM"
	    };
	    if( !(is_defined( request.StopTimeout ))){
	      request.StopTimeout = 10
	    };
	    createContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 400 )
			{
				throw( badParam )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 406 )
			{
				throw( noAttach )
			}
			else if( responseByDocker.("@header").statusCode == 409 )
			{
				throw( conflict )
			}
			else
			{
				undef( responseByDocker.("@header") );
		    response<<responseByDocker
			}
		}
  }]


	[ createExec( request )( response ){
		if( !(is_defined( request.Privileged ))){
      request.Privileged = false
    };
		createExec@DockerD( request )( responseByDocker );
    response<<responseByDocker
	}]


	[ createNetwork( request )( response ){
		scope( createNetwork )
		{
			install( serverError => println@Console("Internal server error")() );
			install( plugNotFound => println@Console("Plugin not found")() );
			install( notSupp => println@Console("Operation not supported for pre-defined networks")() );
			if( !(is_defined( request.Driver ))){
	      request.Driver = "bridge"
	    };
			createNetwork@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( plugNotFound )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 403 )
			{
				throw( notSupp )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
	}]


	[ createVolume( request )( response ){
		scope( createVolume )
		{
			install( serverError => println@Console("Internal server error")() );
			createVolume@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
	}]


	[ deleteStopContainers( request )( response ){
		scope( deleteStopContainers )
		{
			install( serverError => println@Console("Internal server error")() );
			deleteStopContainers@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
	}]


	[ exportContainer( request )( response ){
		scope( exportContainer )
		{
			install( noSuch => println@Console("No such container")() );
			install( serverError => println@Console("Internal server error")() );
			exportContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 ) {
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
  }]


	[ exportImage( request )( response ){
		scope( exportImage )
		{
			install( serverError => println@Console("Internal server error")() );
			exportImage@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
  }]


	[ images( request )( response ){
		scope( images )
		{
			install( serverError => println@Console("Internal server error")() );
	    if( !( is_defined(  request.all  ))){
	      request.all = false
	    };
	    if(  !( is_defined( request.digest ))){
	      request.digest = false
	    };
	    images@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.images<<responseByDocker._
			}
		}
  }]


	[ imageHistory( request )( response ){
		scope( imageHistory )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such image")() );
			imageHistory@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.histories<<responseByDocker._
			}
		}
  }]


  [ imageSearch( request )( response ){
		scope( imageSearch )
		{
			install( serverError => println@Console("Internal server error")() );
	    imageSearch@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.results<<responseByDocker._
			}
		}
  }]


  [ inspect( request )( response ) {
		scope( inspect )
		{
			install( serverError => println@Console("Internal server error")() );
			install( badParam => println@Console("Bad parameter")() );
			install( noSuch => println@Console("No such container")() );
			inspect@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else
			{
				undef( responseByDocker.("@header") );
		    response<<responseByDocker
			}
		}
  }]


	[ inspectImage( request )( response ){
		scope( inspectImage )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such image")() );
			inspectImage@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
  }]


	[ inspectNetwork( request )( response ){
		scope( inspectNetwork )
		{
			install( noSuch => println@Console("Network not found")() );
			inspectNetwork@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.result<<responseByDocker
			}
		}
  }]


	[ inspectVolume( request )( response ){
		install( serverError => println@Console("Internal server error")() );
		install( noSuch => println@Console("No such volume")() );
    inspectVolume@DockerD( request )( responseByDocker );
		if( responseByDocker.("@header").statusCode == 404 )
		{
			throw( noSuch )
		}
		else if( responseByDocker.("@header").statusCode == 500 )
		{
			throw( serverError )
		}
		else
		{
			undef( responseByDocker.("@header") );
			response.result<<responseByDocker
		}
  }]


	[ killContainer( request )( response ){
		scope( killContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			if( !(is_defined( request.signal ))){
	      request.signal = "SIGKILL"
	    };
			killContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.result<<responseByDocker
			}
		}
	}]


  [ listRunProcesses( request )( response ) {
		scope( listRunProcesses )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			if( !(is_defined( request.ps_args ))){
	      request.ps_args="-ef"
	    };
	    listRunProcesses@DockerD(  request  )(  responseByDocker  );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.Titles<<responseByDocker.Titles;
		    response.Processes.row<<responseByDocker.Processes._
			}
		}
  }]


  [ logs( request )( response ){
		scope( logs )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			if( !( is_defined( request.follow ))){
	      request.follow = false
	    };
	    if( !( is_defined( request.stderr ))){
	      request.stderr = false
	    };
	    if( !( is_defined( request.stdout ))){
	      request.stdout = false
	    };
	    if( !( is_defined( request.since ))){
	      request.since = 0
	    };
	    if( !( is_defined( request.timestamps ))){
	      request.timestamps = false
	    };
	    if( !( is_defined( request.tail ))){
	      request.tail = "all"
	    };
	    logs@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
		    response.log<<responseByDocker
			}
		}
  }]


	[ networks( request )( response ){
		scope( networks )
		{
			install( serverError => println@Console("Internal server error")() );
			networks@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.network<<responseByDocker._
			}
		}
  }]


	[ pauseContainer( request )( response ){
		scope( pauseContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			pauseContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
	}]


	[ removeContainer( request )( response ){
		scope( removeContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			install( badParam => println@Console("Bad parameter")() );
			removeContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 400 )
			{
				throw( badParam )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
	}]


  [ removeImage( request )( response ){
		scope( removeImage )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			install( conflict => println@Console("Conflict")() );
	    if( !(is_defined( request.force ))){
	      request.force = false
	    };
	    if( !(is_defined( request.noprune ))){
	      request.noprune = false
	    };
	    removeImage@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 409 )
			{
				throw( conflict )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.info<<responseByDocker._
			}
		}
  }]


	[ removeNetwork( request )( response ){
		scope( removeNetwork )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such network")() );
			removeNetwork@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
	}]


	[ removeVolume( request )( response ){
		scope( removeVolume )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such network")() );
			install( inUse => println@Console("Volume is in use and cannot be removed")() );
			if( !(is_defined( request.force ))){
	      request.force = false
	    };
			removeVolume@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 409 )
			{
				throw( inUse )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
	}]


	[ renameContainer( request )( response ){
		scope( renameContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			install( inUse => println@Console("Name already in use")() );
			renameContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 409 )
			{
				throw( inUse )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
  }]


	[ restartContainer( request )( response ){
		scope( restartContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such network")() );
			restartContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
				throw( noSuch )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
	}]


	[ startContainer( request )( response ){
		scope( startContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			install( alreadyStart => println@Console("Container already started")() );
			startContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 ) {
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 304 ) {
				throw( alreadyStart )
			}
			else if( responseByDocker.("@header").statusCode == 404 ) {
				throw( noSuch )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
  }]


  [ statsContainer( request )( response ){
		scope( statsContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			if( !(is_defined( request.stream ))){
	      request.stream = false
	    };
	    statsContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 ) {
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 404 ) {
				throw( noSuch )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
  }]


	[ stopContainer( request )( response ){
		scope( stopContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			install( alreadyStop => println@Console("Container already stopped")() );
			stopContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 ) {
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 304 ) {
				throw( alreadyStop )
			}
			else if( responseByDocker.("@header").statusCode == 404 ) {
				throw( noSuch )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
  }]


	[ unpauseContainer( request )( response ){
		scope( unpauseContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			unpauseContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 ) {
				throw( serverError )
			}
			else if( responseByDocker.("@header").statusCode == 404 ) {
				throw( noSuch )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
	}]


  [ volumes( request )( response ){
		scope( volumes )
		{
			install( serverError => println@Console("Internal server error")() );
			volumes@DockerD( request )( responseByDocker );
			if(responseByDocker.("@header").statusCode == 500)
			{
				throw( serverError )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
  }]


	[ waitContainer( request )( response ){
		scope( waitContainer )
		{
			install( serverError => println@Console("Internal server error")() );
			install( noSuch => println@Console("No such container")() );
			waitContainer@DockerD( request )( responseByDocker );
			if(responseByDocker.("@header").statusCode == 500)
			{
				throw( serverError )
			}
			else if(responseByDocker.("@header").statusCode == 404){
				throw( noSuch )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response<<responseByDocker
			}
		}
  }]


}
