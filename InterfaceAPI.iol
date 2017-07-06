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

type StandardFaultType: void {
		.status: int
		.message: string
}

type Bridge: void {
	.Aliases?: undefined
	.Links?: undefined
	.EndpointID?: string
	.Gateway?: string
	.GlobalIPv6Address?: string
	.GlobalIPv6PrefixLen?: int
	.IPAddress?: string
	.IPPrefixLen?: int
	.IPv6Gateway?: string
	.MacAddress?: string
	.IPAMConfig?: undefined
	.NetworkID?: string
}

type Config: void {
	.Entrypoint?: undefined
	.AttachStderr?: bool
	.AttachStdin?: bool
	.AttachStdout?: bool
	.ArgsEscaped?: bool
	.Cmd[0, *]: string
	.Domainname?: string
	.Env[0, *]: string
	.Hostname?: string
	.Image?: string
	.Labels?: undefined
	.MacAddress?: string
	.NetworkDisabled?: bool
	.OpenStdin?: bool
	.StdinOnce?: bool
	.Tty?: bool
	.User?: string
	.Volumes?: undefined
	.OnBuild[0, *]: undefined
	.WorkingDir: string
	.StopSignal?: string
	.StopTimeout?: int
	.ExposedPorts?: undefined
	.PublishService?: string
}

type Host: void {
  .GlobalIPv6Address: string
	.IPPrefixLen: int
	.GlobalIPv6PrefixLen: int
	.Aliases: void | string
	.NetworkID: string
	.MacAddress: string
	.IPAMConfig: void | string
	.Gateway: string
	.EndpointID: string
	.Links*: void | string
	.IPv6Gateway: string
	.IPAddress: string
}

type HostConfig: void {
	.MaximumIOps?: int
	.MaximumIOBps?: int
	.BlkioWeight?: int
	.BlkioWeightDevice[0, *]: undefined
	.BlkioDeviceReadBps[0, *]: undefined
	.BlkioDeviceWriteBps[0, *]: undefined
	.BlkioDeviceReadIOps[0, *]: undefined
	.BlkioDeviceWriteIOps[0, *]: undefined
	.Binds?: undefined
	.ContainerIDFile?: string
	.CpusetCpus?: string
	.CpusetMems?: string
	.CpuPercent?: int
	.CpuShares?: int
	.CpuPeriod?: int
	.CpuQuota?: int
	.CpuCount?: int
	.CpuRealtimePeriod?: int
	.CpuRealtimeRuntime?: int
	.CapAdd?: undefined
	.CapDrop?: undefined
	.CgroupParent?: string
	.GroupAdd?: undefined
	.Devices[0, *]: undefined
	.DiskQuota?: int
	.DnsOptions[0, *]: undefined
	.Dns[0, *]: undefined
	.DnsSearch?: undefined
	.VolumesFrom?: undefined
	.IpcMode?: string
	.Isolation?: string
	.LxcConf[0, *]: undefined
	.Memory?: int
	.MemorySwappiness?: int
	.MemorySwap?: int
	.MemoryReservation?: int
	.KernelMemory?: int
	.OomKillDisable?: bool
	.OomScoreAdj?: int
	.NetworkMode?: string
	.NanoCpus?: int
	.PidMode?: string
	.PortBindings?: undefined
	.Privileged?: bool
	.PidsLimit?: int
	.ReadonlyRootfs?: bool
	.Runtime?: string
	.PublishAllPorts?: bool
	.RestartPolicy?: undefined
	.LogConfig[0, *]: undefined
	.Sysctls?: undefined
	.Ulimits[0, *]: undefined
	.VolumeDriver?: string
	.ShmSize?: int
	.UsernsMode?: string
	.ExtraHosts?: undefined
	.UTSMode?: string
	.Cgroup?: string
	.IOMaximumIOps?: int
	.IOMaximumBandwidth?: int
	.AutoRemove?: bool
	.ConsoleSize[0, *]: int
	.Links?: undefined
	.SecurityOpt?: undefined
}

type Mount: void {
	.Name?: string
	.Source?: string
	.Destination?: string
	.Driver?: string
	.Mode?: string
	.RW?: bool
	.Propagation?: string
	.Type?:string
}

type Networks: void {
	.Networks?: void {
    .bridge?: Bridge
    .host?: Host
  }
}

type NetworkSettings: void {
	.Bridge?: string
	.SandboxID?: string
	.HairpinMode?: bool
	.LinkLocalIPv6Address?: string
	.LinkLocalIPv6PrefixLen?: int
	.SandboxKey?: string
	.SecondaryIPAddresses?: undefined
	.SecondaryIPv6Addresses?: undefined
	.EndpointID?: string
	.Gateway?: string
	.GlobalIPv6Address?: string
	.GlobalIPv6PrefixLen?: int
	.IPAddress?: string
	.IPPrefixLen?: int
	.IPv6Gateway?: string
	.MacAddress?: string
	.Networks?: void {
      .bridge?: Bridge
  }
	.Ports?: undefined
}

type NetworkType: void {
	.Name?: string
	.Id?: string
	.Created?: string
	.Scope?: string
	.Driver?: string
	.EnableIPv6?: bool
	.Internal?: bool
	.Labels?: undefined
	.Attachable?: bool
	.IPAM?: void {
		.Driver?: string
		.Config[0, *]: void {
			.Subnet?: string
			.Gateway?: string
		}
		.Options?: undefined
	}
	.Containers?: undefined
	.Options?: undefined
}

type Port: void {
	.PrivatePort?: int
	.PublicPort?: int
	.IP?: string
	.Type?: string
}

type State: void {
	.Error?: string
	.ExitCode?: int
	.FinishedAt?: string
	.OOMKilled?: bool
	.Dead?: bool
	.Paused?: bool
	.Pid?: int
	.Restarting?: bool
	.Running?: bool
	.StartedAt?: string
	.Status?: string
}


/* MESSAGES */

type BuildRequest: void {
	.file: raw
	.Content_type?: string
	.X_Registry_Config?: string     // This is a base64-encoded JSON object with auth configurations for multiple registries that a build may refer to
	.dockerfile?: string            // Path within the build context to the Dockerfile. This is ignored if remote is specified and points to an external Dockerfile
	.t?: string                     // A name and optional tag to apply to the image in the name:tag format. If you omit the tag the default latest value is assumed. You can provide several t parameters
	.remote?: string                // A Git repository URI or HTTP/HTTPS context URI
	.q?: bool                       // Suppress verbose build output
	.nocache?: bool                 // Do not use the cache when building the image
	.cachefrom?: string             // JSON array of images used for build cache resolution
	.pull?: string                  // Attempt to pull the image even if an older image exists locally
	.rm?: bool                      // Remove intermediate containers after a successful build
	.forcerm?: bool                 // Always remove intermediate containers, even upon failure
	.memory?: int
	.memswap?: int                  // Set as -1 to disable swap
	.cpushares?: int
	.cpusetcpus?: string
	.cpuperiod?: int
	.cpuquota?: int
	.buildargs?: int                // JSON map of string pairs for build-time variables. Users pass these values at build-time
	.shmsize?: int
	.squash?: bool
	.labels?: string
	.networkmode?: string           // Sets the networking mode for the run commands during build. Supported standard values are: bridge, host, none, and container:<name|id>. Any other value is taken as a custom network's name to which this container should connect to
}

type BuildResponse: void {
  .message?: string
}

type ChangesRequest: void {
	.id: string 		// ID or name of the container
}

type ChangesResponse: void {
	.changes[0, *]: void {
		.Path?: string
		.Kind?: int
	}
}

type ContainersRequest: void {
	.all?: bool          //< Show all containers. Only running containers are shown by default
	.limit?: int        //< Show limit last created containers, include non-running ones.
	.size?: bool        //< Show the containers sizes
	.filters?: void {
		.exited?: int
		.status?: string
		.label?: undefined
		.isolation?: string
		.id?: string
		.name?: string
		.is_task?: bool
		.ancestor?: string
		.before?: string
		.since?: string
		.volume?: string
		.network?: string
		.health?: string
	}
}

type ContainersResponse: void{
	.container[0, *]: void {
		.Status?: string
		.Mounts[0, *]: Mount
		.Image?: string
		.SizeRw?: int
		.Ports[0, *]: Port
		.Labels?: undefined
		.Created?: int
		.Names[0, *]: string
		.NetworkSettings?: Networks
		.Command?: string
		.State?: string
		.ImageID?: string
		.HostConfig?: void {
			.NetworkMode: string
		}
		.Id?: string
	}
}

type CreateContainerRequest: void {
	.name?: string		// Assign the specified name to the container. Must match /?[a-zA-Z0-9_-]+
	.Hostname?: string
	.Domainname?: string
	.User?: string
	.AttachStdin?: bool
	.AttachStdout?: bool
	.AttachStderr?: bool
	.Tty?: bool
	.OpenStdin?: bool
	.StdinOnce?: bool
	.Env[0, *]: string
	.Cmd[0, *]: string
	.Entrypoint[0, *]: string
	.Image?: string
	.Labels?: undefined
	.Volumes?: undefined
	.WorkingDir?: string
	.NetworkDisabled?: bool
	.MacAddress?: string
	.ExposedPorts?: undefined
	.StopSignal?: string
	.StopTimeout?: int
	.HostConfig?: HostConfig
	.NetworkingConfig?: void {
		.EndpointsConfig?: void {
			.isolated_nw?: void {
				.IPAMConfig?: void {
						.IPv4Address?: string
						.IPv6Address?: string
						.LinkLocalIPs[0, *]: string
				}
				.Links[0, *]: string
				.Aliases[0, *]: string
			}
		}
	}
}

type CreateContainerResponse: void {
	.Id: string
	.Warnings[0, *]: undefined
}

type CreateExecRequest: void {
	.id: string            // Container name or ID
	.AttachStdin?: bool
	.AttachStdout?: bool
	.AttachStderr?: bool
	.DetachKeys?: string
	.Tty?: bool
	.Cmd[0, *]: string
	.Env[0, *]: string
	.Privileged?: bool    // Runs the exec process with extended privileges
	.User?: string        // The user, and optionally, group to run the exec process inside the container. Format is one of: user, user:group, uid, or uid:gid
}

type CreateExecResponse: void {
	.Id: string
	.message?: string
}

type CreateNetworkRequest: void {
	.Name: string
	.CheckDuplicate?: bool
	.Driver?: string
	.Internal?: bool
	.IPAM?: void {
		.Driver?: string
		.Config[0, *]: void {
			.Subnet?: string
			.Gateway?: string
		}
		.Options?: undefined
	}
	.EnableIPv6?: bool
	.Options?: undefined
	.Labels?: undefined
}

type CreateNetworkResponse: void {
	.Id?: string
	.Warning?: string
}

type CreateVolumeRequest: void {
	.Name?: string        // Volume name or ID
	.Driver?: string
	.DriverOpts[0, *]: string
	.Labels?: undefined
}

type CreateVolumeResponse: void {
	.Name: string
	.Driver: string
	.Mountpoint: string
	.Status?: undefined
	.Labels: undefined
	.Scope: string
	.Options: undefined
	.UsageData?: void {
		.Size: int
		.RefCount: int
	}
}

type DeleteStopContainersRequest: void {
  .filters?: string
}

type DeleteStopContainersResponse: void {
  .ContainersDeleted[0, *]: string
  .SpaceReclaimed?: int
}

type ExportContainerRequest: void {
	.id: string			// ID or name of the container
}

type ExportImageRequest: void {
	.name: string 		// Image name or id
}

type ExportImageResponse: void {
	.exporting: undefined
}

type ImageHistoryRequest: void {
	.name: string		// Image name or id
}

type ImageHistoryResponse: void {
	.histories[0, *]: void {
		.Id: string
		.Created: int
		.CreatedBy: string
		.Tags[0, *]: undefined
		.Size: int
		.Comment: string
	}
}

type ImagesRequest: void {
	.all?: bool			// Show all images. Only images from a final layer (no children) are shown by default.
	.filters?: string {
		.dangling?: bool
		.label?: undefined
		.before?: string
		.since?: string
		.reference?: string
	}
	.digest?: bool		// Show digest information as a RepoDigests field on each image
}

type ImagesResponse: void {
	.images[0, *]: void {
		.Id?: string
		.ParentId?: string
		.RepoTags[0, *]: string
		.RepoDigests*: undefined
		.Created?: int
		.Size?: int
		.VirtualSize?: int
		.SharedSize?: int
		.Labels?: undefined
		.Containers?: int
	}
}

type ImageCreateRequest: void {
		.fromImage: string
		.fromSrc?: string
		.repo?: string
		.tag?: string
}

type ImageCreateResponse: void

type ImageSearchRequest: void {
	.term: string		// Term to search
	.limit?: int 		// Maximum number of results to return
	.filters?: string {
		.stars?: int
		.is_official: bool
		.is_automated: bool
	}
}

type ImageSearchResponse: void {
	.results[0, *]: void {
		.description?: string
		.is_official?: bool
		.is_automated?: bool
		.name?: string
		.star_count?: int
	}
}


type InspectContainerRequest: void {
  	.size?: bool        //< Return container size information.
  	.id: string  		//< ID or name of the container
}

type InspectContainerResponse: void {
	.AppArmorProfile?: string
	.Args[0, *]: string
	.Config?: Config
	.Created?: string
	.Driver?: string
	.HostConfig?: HostConfig
	.HostnamePath?: string
	.HostsPath?: string
	.LogPath?: string
	.Id?: string
	.Image?: string
	.GraphDriver?: undefined
	.MountLabel?: string
	.Name?: string
	.NetworkSettings?: NetworkSettings
	.Path?: string
	.ProcessLabel?: string
	.ResolvConfPath?: string
	.RestartCount?: int
	.State?: State
	.Mounts[0, *]: Mount
	.ExecIDs?: undefined
	.SizeRootFs?: int
	.SizeRw?: int
}


type InspectImageRequest: void {
	.name: string		// Image name or id
}

type InspectImageResponse: void {
	.Id?: string
	.Container?: string
	.Comment?: string
	.Os?: string
	.Architecture?: string
	.Parent?: string
	.ContainerConfig?: Config
	.DockerVersion?: string
	.VirtualSize?: int
	.Size?: int
	.Author?: string
	.Created?: string
	.GraphDriver?: undefined
	.RepoDigests[0, *]: undefined
	.RepoTags[0, *]: string
	.Config?: Config
	.RootFS?: void {
		.Type?: string
		.Layers[0, *]: string
	}
}

type InspectNetworkRequest: void {
	.id: string			// Network ID or name
}

type InspectNetworkResponse: void {
	.result: NetworkType
}

type InspectVolumeRequest: void {
	.name: string		// Volume name or ID
}

type InspectVolumeResponse: void {
	.Name: string
	.Driver: string
	.Mountpoint: string
	.Status?: undefined
	.Labels: undefined
	.Options?: void {
		.device?: string
		.o?: string
		.type?: string
	}
	.Scope: string
}

type KillContainerRequest: void {
	.id: string       // Container name or ID
	.signal?: string  // Signal to send to the container as an integer or string (e.g. SIGINT)
}

type KillContainerResponse: void {
  .message?: string
}

type ListRunProcessesRequest: void {
	.id: string			//< ID or name of the container
	.ps_args?: string	// The arguments to pass to ps
}

type ListRunProcessesResponse: void {
	.Titles[0, *]: string
	.Processes[0, *]: void {
		.row[0, *]: string
	}
}

type LogsRequest: void {
	.id: string			//< ID or name of the container
	.follow?: bool  	// return stream
	.stdout?: bool		// show stdout log
	.stderr?: bool		// show stderr log
	.since?:	int		// Specifying a timestamp will only output log-entries since that timestamp
	.timestamps?: bool	// print timestamps for every log line
	.tail?: string		// Only return this number of log lines from the end of the logs. Specify as an integer or all to output all log lines
}

type LogsResponse: void {
	.log: undefined
}

type NetworksRequest: void {
	.filters?: string {
		.driver?: string
		.id?: string
		.label?: undefined
		.name?: string
		.type?: string
	}
}

type NetworksResponse: void {
	.network[0, *]: NetworkType
}

type PauseContainerRequest: void {
	.id: string       // Container name or ID
}

type PauseContainerResponse: void {
	.message?: string
}

type RemoveImageRequest: void {
	.name: string		// Image name or id
	.force?: bool		// Remove the image even if it is being used by stopped containers or has other tags
	.noprune?: bool		// Do not delete untagged parent images
}

type RemoveImageResponse: void {
	.info[0, *]: void {
		.Untagged?: string
		.Deleted?: string
	}
}

type RemoveContainerRequest: void {
  .id: string       // ID or name of the container
  .v?: bool         // Remove the volumes associated with the container
  .force?: bool     // If the container is running, kill it before removing it
}

type RemoveContainerResponse: void {
  .message?: string
}

type RemoveNetworkRequest: void {
  .id: string         // Network name or ID
}

type RemoveNetworkResponse: void {
  .message?: string
}

type RemoveVolumeRequest: void {
  .name: string         // Volume name or ID
  .force?: bool
}

type RemoveVolumeResponse: void {
  .message?: string
}

type RenameContainerRequest: void {
	.id: string				  // ID or name of the container
	.name: string			  // name to replace
}

type RenameContainerResponse: void {
	.message?: string
}

type RestartContainerRequest: void {
  .id: string       // ID or name of the container
  .t?: int          // Number of seconds to wait before killing the container
}

type RestartContainerResponse: void {
  .message?: string
}

type StatsContainerResponse: void {
	.read?: string
	.pids_stats?: void {
		.current?: int
	}
	.networks?: void {
		.eth0?: void {
			.rx_bytes?: int
			.rx_dropped?: int
			.rx_errors?: int
			.rx_packets?: int
			.tx_bytes?: int
			.tx_dropped?: int
			.tx_errors?: int
			.tx_packets?: int
		}
		.eth5?: void {
			.rx_bytes?: int
			.rx_dropped?: int
			.rx_errors?: int
			.rx_packets?: int
			.tx_bytes?: int
			.tx_dropped?: int
			.tx_errors?: int
			.tx_packets?: int
		}
	}
	.memory_stats?: void {
		.stats?: void {
			.total_pgmajfault?: int
			.cache?: int
			.mapped_file?: int
			.total_inactive_file?: int
			.pgpgout?: int
			.rss?: int
			.total_mapped_file?:int
			.writeback?: int
			.unevictable?: int
			.pgpgin?: int
			.total_unevictable?: int
			.pgmajfault?: int
			.total_rss?: int
			.total_rss_huge?: int
			.total_writeback?: int
			.total_inactive_anon?: int
			.rss_huge?: int
			.hierarchial_memory_limit?: int
			.total_pgfault?: int
			.total_active_file?: int
			.active_anon?: int
			.total_active_anon?: int
			.total_pgpgout?: int
			.total_cache?: int
			.inactive_anon?: int
			.active_file?: int
			.pgfault?: int
			.inactive_file?: int
			.total_pgpgin?: int

		}
		.max_usage?: int
		.usage?: int
		.failcnt?: int
		.limit?: int
	}
	.blkio_stats?: undefined
	.cpu_stats?: void {
		.cpu_usage: void {
			.percpu_usage[0, *]: string
			.usage_in_usermode?: int
			.total_usage?: int
			.usage_in_kernelmode?: int
		}
		.system_cpu_usage?: int
		.throttling_data?: void {
			.periods?: int
			.throttled_periods?: int
			.throttled_time?: int
		}
	}
	.precpu_stats?: void {
		.cpu_usage: void {
			.percpu_usage[0, *]: string
			.usage_in_usermode?: int
			.total_usage?: int
			.usage_in_kernelmode?: int
		}
		.system_cpu_usage?: int
		.throttling_data?: void {
			.periods?: int
			.throttled_periods?: int
			.throttled_time?: int
		}
	}
}

type StartContainerRequest: void {
	.id: string 			    // ID or name of the container
	.detachKeys?: string	// Override the key sequence for detaching a container. Format is a single character [a-Z] or ctrl-<value> where <value> is one of: a-z, @, ^, [, , or _
}

type StartContainerResponse: void {
	.message?: string
}

type StatsContainerRequest: void {
	.id: string
	.stream?: bool
}

type StopContainerRequest: void {
	.id: string				// ID or name of the container
	.t?: int 				  // Number of seconds to wait before killing the container
}

type StopContainerResponse: void {
  .message?: string
}

type UnpauseContainerRequest: void {
  .id: string       // Container name or ID
}

type UnpauseContainerResponse: void {
  .message?: string
}


type VolumesRequest: void {
	.filters?: string {
		.name?: string
		.dangling?: bool
		.driver?: string
	}
}

type VolumesResponse: void {
	.Volumes[0, *]: void {
		.Name: string
		.Driver: string
		.Mountpoint: string
		.Labels: undefined
		.Scope: undefined
		.Options?: void {
			.device?: string
			.o?: string
			.type?: string
		}
	}
	.Warnings[0, *]: void
}

type WaitContainerRequest: void {
  .id: string       // Container name or ID
}

type WaitContainerResponse: void {
  .StatusCode: int
}

interface InterfaceAPI {
  RequestResponse:
	/* build an image starting from a file https://docs.docker.com/engine/api/v1.29/#operation/ImageBuild */
	build( BuildRequest )( BuildResponse )
		throws BadParam( StandardFaultType ) ServerError( StandardFaultType ),

	/* get changes on a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerChanges */
	changesOnCtn( ChangesRequest )( ChangesResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* List containers https://docs.docker.com/engine/api/v1.29/#operation/ContainerList */
	containers( ContainersRequest )( ContainersResponse )
		throws BadParam( StandardFaultType ) ServerError( StandardFaultType ),

	/* Create a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerCreate */
	createContainer( CreateContainerRequest )( CreateContainerResponse )
		throws BadParam( StandardFaultType ) ServerError( StandardFaultType ) NoSuchImage( StandardFaultType ) NoAttachment( StandardFaultType ) Conflict( StandardFaultType ),

	/* Create an exec instance https://docs.docker.com/engine/api/v1.29/#operation/ContainerExec */
	createExec( CreateExecRequest )( CreateExecResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ) ContainerPaused( StandardFaultType ),

	/* Create a network https://docs.docker.com/engine/api/v1.29/#operation/NetworkCreate */
	createNetwork( CreateNetworkRequest )( CreateNetworkResponse )
		throws PluginNotFound( StandardFaultType ) ServerError( StandardFaultType ) OperationNotSupported( StandardFaultType ),

	/* Create a volume https://docs.docker.com/engine/api/v1.29/#operation/VolumeCreate */
	createVolume( CreateVolumeRequest )( CreateVolumeResponse )
		throws ServerError( StandardFaultType ),

	/* delete stopped containers https://docs.docker.com/engine/api/v1.29/#operation/ContainerPrune */
	deleteStoppedContainers( DeleteStopContainersRequest )( DeleteStopContainersResponse )
		throws ServerError( StandardFaultType ),

	/* export a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerExport */
	exportContainer( ExportContainerRequest )( undefined )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* export image https://docs.docker.com/engine/api/v1.29/#operation/ContainerExport */
	exportImage( ExportImageRequest )( ExportImageResponse )
		throws ServerError( StandardFaultType ),

	/* List all images https://docs.docker.com/engine/api/v1.29/#operation/ImageList */
	images( ImagesRequest )( ImagesResponse )
		throws ServerError( StandardFaultType ) NoRepository( StandardFaultType ),

	/* Create an image https://docs.docker.com/engine/api/v1.29/#operation/ImageCreate */
	imageCreate( ImageCreateRequest )( ImageCreateResponse )
		throws NoRepository( StandardFaultType ) ServerError( StandardFaultType ),

	/* get the history of the image https://docs.docker.com/engine/api/v1.29/#operation/ImageHistory */
	imageHistory( ImageHistoryRequest )( ImageHistoryResponse )
		throws NoImage( StandardFaultType ) ServerError( StandardFaultType ),

	/* Search images https://docs.docker.com/engine/api/v1.29/#operation/ImageSearch */
	imageSearch( ImageSearchRequest )( ImageSearchResponse )
		throws ServerError( StandardFaultType ),

	/* Inspect a container https://docs.docker.com/engine/api/v1.29/#operation/ImageInspect*/
	inspectContainer( InspectContainerRequest )( InspectContainerResponse )
		throws ServerError( StandardFaultType ) NoSuchContainer( StandardFaultType ),

	/* Inspect an image https://docs.docker.com/engine/api/v1.29/#operation/ImageInspect */
	inspectImage( InspectImageRequest )( InspectImageResponse )
		throws ServerError( StandardFaultType ) NoSuchImage( StandardFaultType ),

	/* inspect a network https://docs.docker.com/engine/api/v1.29/#operation/NetworkInspect */
	inspectNetwork( InspectNetworkRequest )( InspectNetworkResponse )
		throws NoSuchNetwork( StandardFaultType ),

	/* inspect a volume https://docs.docker.com/engine/api/v1.29/#operation/VolumeInspect */
	inspectVolume( InspectVolumeRequest )( InspectVolumeResponse )
		throws ServerError( StandardFaultType ) NoSuchVolume( StandardFaultType ),

	/* Kill a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerKill */
	killContainer( KillContainerRequest )( KillContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* List processes inside a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerTop */
	listRunProcesses( ListRunProcessesRequest )( ListRunProcessesResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* Get container logs https://docs.docker.com/engine/api/v1.29/#operation/ContainerLogs */
	logs( LogsRequest )( LogsResponse ),

	/* List netowrks https://docs.docker.com/engine/api/v1.29/#operation/NetworkList */
	networks( NetworksRequest )( NetworksResponse )
		throws ServerError( StandardFaultType ),

	/* Pause a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerPaused */
	pauseContainer( PauseContainerRequest )( PauseContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* Remove a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerDelete */
	removeContainer( RemoveContainerRequest )( RemoveContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ) BadParam( StandardFaultType ),

	/* 	Remove an image https://docs.docker.com/engine/api/v1.29/#operation/ImageDelete */
	removeImage( RemoveImageRequest )( RemoveImageResponse )
		throws NoSuchImage( StandardFaultType ) ServerError( StandardFaultType ) Conflict( StandardFaultType ),

	/* Remove a network https://docs.docker.com/engine/api/v1.29/#operation/NetworkDelete */
	removeNetwork( RemoveNetworkRequest )( RemoveNetworkResponse )
		throws Conflict( StandardFaultType ) ServerError( StandardFaultType ),

	/* Remove a volume https://docs.docker.com/engine/api/v1.29/#operation/VolumeDelete */
	removeVolume( RemoveVolumeRequest )( RemoveVolumeResponse )
		throws NoSuchVolume( StandardFaultType ) VolumeInUse( StandardFaultType ) ServerError( StandardFaultType ),

	/* Rename a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerRename */
	renameContainer( RenameContainerRequest )( RenameContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ) ContainerInUse( StandardFaultType ),

	/* Restart a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerRestart */
	restartContainer( RestartContainerRequest )( RestartContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* Start a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerRestart*/
	startContainer( StartContainerRequest )( StartContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ) AlreadyStarted( StandardFaultType ),

	/* container stats based on resource usage https://docs.docker.com/engine/api/v1.29/#operation/ContainerStats */
	statsContainer( StatsContainerRequest )( StatsContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* stop a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerStop */
	stopContainer( StopContainerRequest )( StopContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ) AlreadyStopped( StandardFaultType ),

	/* Unpause a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerUnpause */
	unpauseContainer( UnpauseContainerRequest )( UnpauseContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* List volumes https://docs.docker.com/engine/api/v1.29/#operation/VolumeList */
	volumes( VolumesRequest )( VolumesResponse )
		throws ServerError( StandardFaultType ),

	/* Wait for a container https://docs.docker.com/engine/api/v1.29/#operation/ContainerWait */
	waitContainer( WaitContainerRequest )( WaitContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType )
}
