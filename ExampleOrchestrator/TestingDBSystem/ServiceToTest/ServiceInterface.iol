type GentContentRequest: void {
    .field1: string
}

type GetContentResponse: void {
    .field2: string
}

interface ServiceInterface {
  RequestResponse:
    getContent( GentContentRequest )( GetContentResponse )
}
