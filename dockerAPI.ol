/*
Copyright 2017 Andrea Junior Berselli <junior.berselli@gmail.com>
Copyright 2017 Claudio Guidi <guidiclaudio@gmail.com>


Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

include "console.iol"
include "string_utils.iol"
include "json_utils.iol"
include "ini_utils.iol"

include "InterfaceAPI.iol"

inputPort DockerIn {
	Location: "auto:ini:/Locations/JockerLocation:file:config.ini"
	Protocol: sodep
	Interfaces: InterfaceAPI
}

outputPort DockerD {
  Protocol: http {
		.responseHeaders="@header";
		.debug = true;
		.debug.showContent=true;
		.format->format;
		.contentType->contentType;
		.statusCode->statusCode;

		.osc.build.alias = "build?q=%!{q}&nocache=%!{nocache}&rm=%!{rm}&forcerm=%!{forcerm}&t=%!{t}&dockerfile=%!{dockerfile}";
		.osc.build.method = "post";
		.osc.build.method.queryFormat = "json";

		.osc.changesOnCtn.alias = "containers/%!{id}/changes";
		.osc.changesOnCtn.method = "get";
		.osc.changesOnCtn.method.queryFormat = "json";

		.osc.containers.alias = "containers/json";
		.osc.containers.method = "get";
		.osc.containers.method.queryFormat = "json";

		.osc.createContainer.alias = "containers/create?name=%!{name}";
		.osc.createContainer.method = "post";
		.osc.createContainer.method.queryFormat = "json";

		.osc.createExec.alias = "containers/%!{id}/exec";
		.osc.createExec.method = "post";
		.osc.createExec.method.queryFormat = "json";

		.osc.createNetwork.alias = "networks/create";
		.osc.createNetwork.method = "post";
		.osc.createNetwork.method.queryFormat = "json";

		.osc.createVolume.alias = "volumes/create";
		.osc.createVolume.method = "post";
		.osc.createVolume.method.queryFormat = "json";

		.osc.deleteStoppedContainers.alias = "containers/prune";
		.osc.deleteStoppedContainers.method = "post";
		.osc.deleteStoppedContainers.method.queryFormat = "json";

		.osc.images.alias = "images/json";
		.osc.images.method = "get";
		.osc.images.method.queryFormat = "json";

		.osc.imageCreate.alias = "images/create?fromImage=%!{fromImage}&fromSrc=%!{fromSrc}&repo=%!{repo}&tag=%!{tag}";
		.osc.imageCreate.method = "post";
		.osc.imageCreate.method.queryFormat = "json";
		.osc.imageCreate.forceContentDecoding = "string";

		.osc.imageHistory.alias = "images/%!{name}/history";
		.osc.imageHistory.method = "get";
		.osc.imageHistory.method.queryFormat = "json";

		.osc.imageSearch.alias = "images/search";
		.osc.imageSearch.method = "get";
		.osc.imageSearch.method.queryFormat = "json";

		.osc.inspectContainer.alias = "containers/%!{id}/json";
		.osc.inspectContainer.method = "get";
		.osc.inspectContainer.method.queryFormat = "json";

		.osc.inspectImage.alias = "images/%!{name}/json";
		.osc.inspectImage.method = "get";
		.osc.inspectImage.method.queryFormat = "json";

		.osc.inspectNetwork.alias = "networks/%!{id}";
		.osc.inspectNetwork.method = "get";
		.osc.inspectNetwork.method.queryFormat = "json";

		.osc.inspectVolume.alias = "volumes/%!{name}";
		.osc.inspectVolume.method = "get";
		.osc.inspectVolume.method.queryFormat = "json";

		.osc.killContainer.alias = "containers/%!{id}/kill";
		.osc.killContainer.method = "post";
		.osc.killContainer.method.queryFormat = "json";

		.osc.listRunProcesses.alias = "containers/%!{id}/top";
		.osc.listRunProcesses.method = "get";
		.osc.listRunProcesses.method.queryFormat = "json";

		.osc.logs.alias = "containers/%!{id}/logs";
		.osc.logs.method = "get";
		.osc.logs.method.queryFormat = "json";

		.osc.networks.alias = "networks";
		.osc.networks.method = "get";
		.osc.networks.method.queryFormat = "json";

		.osc.exportImage.alias = "images/%!{name}/get";
		.osc.exportImage.method = "get";
		.osc.exportImage.method.queryFormat = "json";

		.osc.exportContainer.alias = "containers/%!{id}/export";
		.osc.exportContainer.method = "get";
		.osc.exportContainer.method.queryFormat = "json";

		.osc.pauseContainer.alias = "containers/%!{id}/pause";
		.osc.pauseContainer.method = "post";
		.osc.pauseContainer.method.queryFormat = "json";

		.osc.removeContainer.alias = "containers/%!{id}";
		.osc.removeContainer.method = "delete";
		.osc.removeContainer.method.queryFormat = "json";

		.osc.removeImage.alias = "images/%!{name}?force=%!{force}&noprune=%!{noprune}";
		.osc.removeImage.method = "delete";
		.osc.removeImage.method.queryFormat = "json";

		.osc.removeNetwork.alias = "networks/%!{id}";
		.osc.removeNetwork.method = "delete";
		.osc.removeNetwork.method.queryFormat = "json";

		.osc.removeVolume.alias = "volumes/%!{name}?force=%!{force}";
		.osc.removeVolume.method = "delete";
		.osc.removeVolume.method.queryFormat = "json";

		.osc.renameContainer.alias = "containers/%!{id}/rename?name=%!{name}";
		.osc.renameContainer.method = "post";
		.osc.renameContainer.method.queryFormat = "json";

		.osc.restartContainer.alias = "containers/%!{id}/restart";
		.osc.restartContainer.method = "post";
		.osc.restartContainer.method.queryFormat = "json";

		.osc.statsContainer.alias = "containers/%!{id}/stats";
		.osc.statsContainer.method = "get";
		.osc.statsContainer.method.queryFormat = "json";

		.osc.startContainer.alias = "containers/%!{id}/start";
		.osc.startContainer.method = "post";
		.osc.startContainer.method.queryFormat = "json";

		.osc.stopContainer.alias = "containers/%!{id}/stop";
		.osc.stopContainer.method = "post";
		.osc.stopContainer.method.queryFormat = "json";

		.osc.unpauseContainer.alias = "containers/%!{id}/unpause";
		.osc.unpauseContainer.method = "post";
		.osc.unpauseContainer.method.queryFormat = "json";

		.osc.volumes.alias = "volumes";
		.osc.volumes.method = "get";
		.osc.volumes.method.queryFormat = "json";

		.osc.waitContainer.alias = "containers/%!{id}/wait";
		.osc.waitContainer.method = "post";
		.osc.waitContainer.method.queryFormat = "json"
  }
  RequestResponse:
	build,
	changesOnCtn,
	containers,
	createContainer,
	createExec,
	createNetwork,
	createVolume,
	deleteStoppedContainers,
	exportContainer,
	exportImage,
	images,
	imageCreate,
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
	contentType = "application/json";
	parseIniFile@IniUtils( "config.ini" )( config );
	DockerD.location = config.Locations.DockerLocation
}

main {

	[ build( request )( response ){
		scope( build )
		{
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
					fault.status = 400;
					fault.message = "BadParam";
					throw( BadParam )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server error";
					throw( ServerError, fault )
			}
			else
			{
					undef( responseByDocker.("@header") );
					response.message << responseByDocker
			}
		}
	}]


	[ changesOnCtn( request )( response ){
		scope( changesOnCtn )
		{
			changesOnCtn@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server error";
					throw( ServerError, fault )
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
			/*if( !( is_defined( request.all ) ) ) { request.all = false };
			if( !( is_defined( request.size ) ) ) { request.size = false };*/
			if ( is_defined( request.filters ) ) {
				  foreach( f : request.filters ) {
							filt.( f )._ = request.filters.( f )
					};
					json_transf << filt;
					getJsonString@JsonUtils( json_transf )( filtersJson );
					println@Console( filtersJson )();
					undef( request.filters );
					request.filters = filtersJson
			};
			containers@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 400 )
			{
					fault.status = 400;
					fault.message = "Bad parameter";
					throw( BadParam, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
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
			if ( is_defined( request.Env ) && #request.Env == 1 ) {
					env = request.Env;
					undef( request.Env );
					request.Env._ = env
			};
			createContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 400 )
			{
					fault.status = 400;
					fault.message = "Bad Parameter";
					throw( BadParam, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else if( responseByDocker.("@header").statusCode == 404 )
			{
					fault.status = 404;
					fault.message = "No such image";
					throw( NoSuchImage, fault )
			}
			else if( responseByDocker.("@header").statusCode == 406 )
			{
					fault.status = 406;
					fault.message = "Impossible to Attach";
					throw( NoAttachment, fault )
			}
			else if( responseByDocker.("@header").statusCode == 409 )
			{
					fault.status = 409;
					fault.message = "Conflict";
					throw( Conflict, fault )
			}
			else
			{
					undef( responseByDocker.("@header") );
			    response<<responseByDocker
			}
		}
  }]


	[ createExec( request )( response ){
			if( !( is_defined( request.Privileged )) ) {
					request.Privileged = false
			};
			createExec@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			} else if( responseByDocker.("@header").statusCode == 409 ) {
					fault.status = 409;
					fault.message = "Container is paused";
					throw( ContainerPaused, fault )
			} else if( responseByDocker.("@header").statusCode == 500 ) {
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			};
			response << responseByDocker
	}]


	[ createNetwork( request )( response ){
		scope( createNetwork )
		{
				if( !(is_defined( request.Driver ))){
						request.Driver = "bridge"
				};
				createNetwork@DockerD( request )( responseByDocker );
				if( responseByDocker.("@header").statusCode == 404 )
				{
						fault.status = 404;
						fault.message = "Plugin Not Found";
						throw( PluginNotFound, fault )
				}
				else if( responseByDocker.("@header").statusCode == 500 )
				{
						fault.status = 500;
						fault.message = "Server Error";
						throw( ServerError, fault )
				}
				else if( responseByDocker.("@header").statusCode == 403 )
				{
						fault.status = 403;
						fault.message = "Operation Not Supported";
						throw( OperationNotSupported, fault )
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
				createVolume@DockerD( request )( responseByDocker );
				if( responseByDocker.("@header").statusCode == 500 )
				{
						fault.status = 500;
						fault.message = "Server Error";
						throw( ServerError, fault )
				}
				else
				{
						undef( responseByDocker.("@header") );
						response<<responseByDocker
				}
		}
	}]


	[ deleteStoppedContainers( request )( response ){
		scope( deleteStoppedContainers )
		{
				deleteStoppedContainers@DockerD( request )( responseByDocker );
				if( responseByDocker.("@header").statusCode == 500 )
				{
						fault.status = 500;
						fault.message = "Server Error";
						throw( ServerError, fault )
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
			exportContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 ) {
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server error";
					throw( ServerError, fault )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response << responseByDocker
			}
		}
  }]


	[ exportImage( request )( response ){
			scope( exportImage )
			{
					exportImage@DockerD( request )( responseByDocker );
					if( responseByDocker.("@header").statusCode == 500 )
					{
							fault.status = 500;
							fault.message = "Server error";
							throw( ServerError, fault )
					}
					else
					{
							undef( responseByDocker.("@header") );
							response << responseByDocker
					}
			}
  }]


	[ images( request )( response ){
			scope( images )
			{
					if( !( is_defined(  request.all  ))){
					  request.all = false
					};
					if(  !( is_defined( request.digest ))){
					  request.digest = false
					};
					images@DockerD( request )( responseByDocker );
					if( responseByDocker.("@header").statusCode == 500 )
					{
							fault.status = 500;
							fault.message = "Server error";
							throw( ServerError, fault )
					} else {
							undef( responseByDocker.("@header") );
							response.images<<responseByDocker._
					}
			}
  }]

	[ imageCreate( request )( response ) {
			scope( imageCreate ) {
					imageCreate@DockerD( request )( responseByDocker );
					if( responseByDocker.("@header").statusCode == 404 )
					{
						fault.status = 404;
						fault.message = "Repository does not exist or no read access";
						throw( NoRepository, fault )
					}
					else if( responseByDocker.("@header").statusCode == 500 )
					{
						fault.status = 500;
						fault.message = "Server error";
						throw( ServerError )
					}
			}
	}]

	[ imageHistory( request )( response ){
			scope( imageHistory )
			{
					imageHistory@DockerD( request )( responseByDocker );
					if( responseByDocker.("@header").statusCode == 404 )
					{
							fault.status = 404;
							fault.message = "No such image";
							throw( NoImage )
					}
					else if( responseByDocker.("@header").statusCode == 500 )
					{
							fault.status = 500;
							fault.message = "Server error";
							throw( ServerError )
					}
			}
  }]


  [ imageSearch( request )( response ){
			scope( imageSearch )
			{
			    imageSearch@DockerD( request )( responseByDocker );
					if( responseByDocker.("@header").statusCode == 500 )
					{
							fault.status = 500;
							fault.message = "Server error";
							throw( ServerError )
					}
					else
					{
							undef( responseByDocker.("@header") );
							response.results<<responseByDocker._
					}
			}
  }]


  [ inspectContainer( request )( response ) {
			scope( inspect )
			{
					inspect@DockerD( request )( responseByDocker );
					if( responseByDocker.("@header").statusCode == 500 )
					{
							fault.status = 500;
							fault.message = "Server error";
							throw( ServerError, fault )
					}
					else if( responseByDocker.("@header").statusCode == 404 )
					{
							fault.status = 404;
							fault.message = "No such a container";
							throw( NoSuchContainer, fault )
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
					inspectImage@DockerD( request )( responseByDocker );
					if( responseByDocker.("@header").statusCode == 500 )
					{
							fault.status = 500;
							fault.message = "Server error";
							throw( ServerError, fault )
					}
					else if( responseByDocker.("@header").statusCode == 404 )
					{
							fault.status = 404;
							fault.message = "No such an image";
							throw( NoSuchImage, fault )
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
					fault.status = 404;
					fault.message = "No such a network";
					throw( NoSuchNetwork, fault )
			}
			else
			{
					undef( responseByDocker.("@header") );
					response.result<<responseByDocker
			}
		}
  }]


	[ inspectVolume( request )( response ){
    inspectVolume@DockerD( request )( responseByDocker );
		if( responseByDocker.("@header").statusCode == 404 )
		{
				fault.status = 404;
				fault.message = "No such a volume";
				throw( NoSuchVolume, fault )
		}
		else if( responseByDocker.("@header").statusCode == 500 )
		{
				fault.status = 500;
				fault.message = "Server Error";
				throw( ServerError, fault )
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
			if( !(is_defined( request.signal ))){
	      request.signal = "SIGKILL"
	    };
			killContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
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
			if( !(is_defined( request.ps_args ))){
					request.ps_args="-ef"
			};
			listRunProcesses@DockerD(  request  )(  responseByDocker  );
			if( responseByDocker.("@header").statusCode == 404 )
			{
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.Titles << responseByDocker.Titles;
		    response.Processes.row << responseByDocker.Processes._
			}
		}
  }]

	[ logs( request )( response ){
			scope( logs )
			{
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
							fault.status = 404;
							fault.message = "No Such a container";
							throw( NoSuchContainer, fault )
					}
					else if( responseByDocker.("@header").statusCode == 500 )
					{
							fault.status = 500;
							fault.message = "Server Error";
							throw( ServerError, fault )
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
							fault.status = 500;
							fault.message = "Server Error";
							throw( ServerError, fault )
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
			pauseContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault  )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else
			{
					undef( responseByDocker.("@header") );
					response << responseByDocker
			}
		}
	}]


	[ removeContainer( request )( response ){
		scope( removeContainer )
		{
			removeContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else if( responseByDocker.("@header").statusCode == 400 )
			{
					fault.status = 400;
					fault.message = "Bad Parameter";
					throw( BadParam, fault )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response << responseByDocker
			}
		}
	}]


  [ removeImage( request )( response ){
		scope( removeImage )
		{
			if( !(is_defined( request.force ))){
					request.force = false
			};
			if( !(is_defined( request.noprune ))){
					request.noprune = false
			};
			removeImage@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
					fault.status = 404;
					fault.message = "No such an image";
					throw( NoSuchAnImage, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else if( responseByDocker.("@header").statusCode == 409 )
			{
					fault.status = 409;
					fault.message = "Conflict";
					throw( Conflict, fault )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response.info << responseByDocker._
			}
		}
  }]


	[ removeNetwork( request )( response ){
		scope( removeNetwork )
		{
			removeNetwork@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
					fault.status = 404;
					fault.message = "Conflict";
					throw( Conflict, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else
			{
					undef( responseByDocker.("@header") );
					response << responseByDocker
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
					fault.status = 404;
					fault.message = "No such a volume";
					throw( NoSuchVolume, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else if( responseByDocker.("@header").statusCode == 409 )
			{
					fault.status = 409;
					fault.message = "Volume in use and cannot be removed";
					throw( VolumeInUse, fault )
			}
			else
			{
					undef( responseByDocker.("@header") );
					response << responseByDocker
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
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else if( responseByDocker.("@header").statusCode == 409 )
			{
					fault.status = 409;
					fault.message = "Continer In Use";
					throw( ContainerInUse, fault )
			}
			else
			{
					undef( responseByDocker.("@header") );
					response << responseByDocker
			}
		}
  }]


	[ restartContainer( request )( response ){
		scope( restartContainer )
		{
			restartContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 404 )
			{
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else if( responseByDocker.("@header").statusCode == 500 )
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response << responseByDocker
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
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else if( responseByDocker.("@header").statusCode == 304 ) {
					fault.status = 304;
					fault.message = "Already Started";
					throw( AlreadyStarted, fault )
			}
			else if( responseByDocker.("@header").statusCode == 404 ) {
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else
			{
					undef( responseByDocker.("@header") );
					response << responseByDocker
			}
		}
  }]


  [ statsContainer( request )( response ){
		scope( statsContainer )
		{
			if( !(is_defined( request.stream ))){
					request.stream = false
			};
			statsContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 ) {
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else if( responseByDocker.("@header").statusCode == 404 ) {
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response << responseByDocker
			}
		}
  }]


	[ stopContainer( request )( response ){
		scope( stopContainer )
		{
			stopContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 ) {
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else if( responseByDocker.("@header").statusCode == 304 ) {
					fault.status = 304;
					fault.message = "Already Stopped";
					throw( AlreadyStopped, fault )
			}
			else if( responseByDocker.("@header").statusCode == 404 ) {
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
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
			unpauseContainer@DockerD( request )( responseByDocker );
			if( responseByDocker.("@header").statusCode == 500 ) {
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else if( responseByDocker.("@header").statusCode == 404 ) {
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else
			{
					undef( responseByDocker.("@header") );
					response << responseByDocker
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
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response << responseByDocker
			}
		}
  }]


	[ waitContainer( request )( response ){
		scope( waitContainer )
		{
			waitContainer@DockerD( request )( responseByDocker );
			if(responseByDocker.("@header").statusCode == 500)
			{
					fault.status = 500;
					fault.message = "Server Error";
					throw( ServerError, fault )
			}
			else if(responseByDocker.("@header").statusCode == 404){
					fault.status = 404;
					fault.message = "No such a container";
					throw( NoSuchContainer, fault )
			}
			else
			{
				undef( responseByDocker.("@header") );
				response << responseByDocker
			}
		}
  }]


}
