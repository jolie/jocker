execution{ concurrent }


inputPort input {
  Location: "socket://localhost:9000"
  Protocol: sodep
  RequestResponse: get
}


main {
  get( request )( response ){
    response = "HELLO WORLD"
  }
}
