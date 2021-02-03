This project is based on:
* https://github.com/asim/go-micro/tree/master/examples/gateway
* https://github.com/asim/go-micro/tree/master/examples/greeter

Note:
* [20210203]: with original source, invoke "./script/greet.sh World" get intermittent result of either:
    - {"error":"OK: HTTP status code 200; transport: missing content-type field","code":2,"message":"OK: HTTP status code 200; transport: missing content-type field"}
    - {"msg":"Hello World"}
