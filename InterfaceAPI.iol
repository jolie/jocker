type InspectRequest: void {
  	.size?: bool        //< Return container size information.
  	.id: string  		//< ID or name of the container
}
type ContainersRequest: void {
  	.all: bool          //< Show all containers. Only running containers are shown by default
	.limit?: int        //< Show limit last created containers, include non-running ones.
  	.size?: bool        //< Show the containers sizes
  	.filters?: undefined
}
type BridgeType: void{
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
type Bridge: void {
	.bridge: BridgeType
}
type Networks: void {
	.Networks: Bridge
}
type Port: void {
	.PrivatePort: int
	.PublicPort: int
	.Type: string
}
type Mount: void {
	.Name: string
	.Source: string
	.Destination: string
	.Driver: string
	.Mode: string
	.Rw: bool
	.Propagation: string
}
type ContainerType: void {
	.Status: string
	.Mounts[0, *]: Mount
	.Image: string
	.SizeRw?: int
	.Ports[0, *]: Port
	.Labels: undefined
	.Created: int
	.Names[0, *]: string
	.NetworkSettings: Networks
	.Command: string
	.State: string
	.ImageID: string
	.HostConfig: undefined
	.Id: string
}
type ContainersResponse: void{
	.container[0, *]: ContainerType 
}
type Config: void {
	.AttachStderr: bool
	.AttachStdin: bool
	.AttachStdout: bool
	.Cmd[0, *]: string
	.Domainname: string
	.Env[1, *]: string
	.Hostname: string
	.Image: string
	.Labels: undefined
	.MacAddress: string
	.NetworkDisabled: bool
	.OpenStdin: bool
	.StdinOne: bool
	.Tty: bool
	.User: string
	.Volumes: undefined
	.WorkingDir: string
	.StopSignal: string
	.StopTimeout: int
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
	.ContainerIDFile?: string
	.CpusetCpus?: string
	.CpusetMems?: string
	.CpuPercent?: int
	.CpuShares?: int
	.CpuPeriod?: int
	.CpuRealtimePeriod?: int
	.CpuRealtimeRuntime?: int
	.Cevices[0, *]: undefined
	.IpcMode?: string
	.LxcConf[0, *]: undefined
	.Memory?: int
	.MemorySwap?: int
	.MemoryReservation?: int
	.KernelMemory?: int
	.OomKillDisable?: bool
	.OomScoreAdj?: int
	.NetworkMode: string
	.PidMode?: string
	.PortBindings?: undefined
	.Privileged?: bool
	.ReadonlyRootfs?: bool
	.PublishAllPorts?: bool
	.RestartPolicy?: undefined
	.LogConfig?: undefined
	.Sysctls?: undefined
	.Ulimits[0, *]: undefined
	.VolumeDriver?: string
	.ShmSize?: int
}
type State: void {
	.Error: string
	.ExitCode: int
	.FinishedAt: string
	.OomKilled: bool
	.Dead: bool
	.Paused: bool
	.Pid: int
	.Restarting: bool
	.Running: bool
	.StartedAt: string
	.Status: string
}
type InspectResponse: void {
	.AppArmorProfile: string
	.Args[0, *]: string
	.Config: Config
	.Created: string
	.Driver: string
	.HostConfig: HostConfig
	.HostnamePath: string
	.HostsPath: string
	.LogPath: string
	.Id: string
	.Image: string
	.MountLabel: string
	.Name: string
	.NetworkSettings: Networks
	.Path: string
	.ProcessLabel: string
	.ResolvConfPath: string
	.RestartCount: int
	.State: State
	.Mounts[0, *]: Mount
}

interface InterfaceAPI {
  RequestResponse:
  	containers( ContainersRequest )( ContainersResponse ),
    inspect( InspectRequest )( InspectResponse )
}