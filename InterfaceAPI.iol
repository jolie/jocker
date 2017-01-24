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
	.Entrypoint: undefined
	.AttachStderr: bool
	.AttachStdin: bool
	.AttachStdout: bool
	.ArgsEscaped: bool
	.Cmd[0, *]: string
	.Domainname: string
	.Env[0, *]: string
	.Hostname: string
	.Image: string
	.Labels: undefined
	.MacAddress?: string
	.NetworkDisabled?: bool
	.OpenStdin: bool
	.StdinOnce: bool
	.Tty: bool
	.User: string
	.Volumes: undefined
	.OnBuild: undefined
	.WorkingDir: string
	.StopSignal?: string
	.StopTimeout?: int
	.ExposedPorts: undefined
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
	.NetworkMode: string
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
type State: void {
	.Error: string
	.ExitCode: int
	.FinishedAt: string
	.OOMKilled: bool
	.Dead: bool
	.Paused: bool
	.Pid: int
	.Restarting: bool
	.Running: bool
	.StartedAt: string
	.Status: string
}
type NetworkSettings: void {
	.Bridge: string
	.SandboxID: string
	.HairpinMode: bool
	.LinkLocalIPv6Address: string
	.LinkLocalIPv6PrefixLen: int
	.SandboxKey: string
	.SecondaryIPAddresses: undefined
	.SecondaryIPv6Addresses: undefined
	.EndpointID: string
	.Gateway: string
	.GlobalIPv6Address?: string
	.GlobalIPv6PrefixLen?: int
	.IPAddress: string
	.IPPrefixLen: int
	.IPv6Gateway: string
	.MacAddress: string
	.Networks: Bridge
	.Ports: undefined
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
	.GraphDriver?: undefined
	.MountLabel: string
	.Name: string
	.NetworkSettings: NetworkSettings
	.Path: string
	.ProcessLabel: string
	.ResolvConfPath: string
	.RestartCount: int
	.State: State
	.Mounts[0, *]: Mount
	.ExecIDs: undefined
}

interface InterfaceAPI {
  RequestResponse:
  	containers( ContainersRequest )( ContainersResponse ),
    inspect( InspectRequest )( InspectResponse )
}