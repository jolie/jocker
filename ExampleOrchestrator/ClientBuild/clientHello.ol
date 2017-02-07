include "console.iol"

outputPort p {
  Location: "socket://192.168.99.100:2357"
  Protocol: sodep
  RequestResponse: get
}

main {
  get@p()(response);
  println@Console(response)()
}
