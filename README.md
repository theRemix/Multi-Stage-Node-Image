# Multi-Stage Node Image

Demo repo for building a minimal node app image

See [Dockerfile](./Dockerfile)

## Building

Building the multi-stage docker image will run the tests, and only complete the build if the tests pass.

```sh
docker build -t theremix/multi-stage-node-image:latest .
```

this will run the tests in `test/`, then copy over just the artifacts needed to run the project in production, resulting in a minimal docker image

```
Successfully tagged theremix/multi-stage-node-image:latest
```

## Test Failures

Watch the build fail by changing the `test/api-spec.js`, then attempt to build again.

results:

```
> multi-stage-node-image@1.0.0 test /build
> mocha



  Basic demo http json api
    1) should respond to GET /


  0 passing (28ms)
  1 failing

  1) Basic demo http json api
       should respond to GET /:

      AssertionError: expected 'ok' to equal 'not ok'
      + expected - actual

      -ok
      +not ok

      at request.get.expect.expect.expect.then.res (test/api-spec.js:14:31)
      at <anonymous>
      at process._tickCallback (internal/process/next_tick.js:188:7)



npm ERR! Test failed.  See above for more details.
The command '/bin/sh -c npm test' returned a non-zero code: 1
```

## Running

Run a container with

```sh
docker run --rm -it -p 3000:3000 theremix/multi-stage-node-image:latest
```

or daemonized with

```sh
docker run -d --name=multi-stage-node-demo -p 3000:3000 theremix/multi-stage-node-image:latest
```

### use curl

```sh
curl localhost:3000
```
```sh
{"data":"ok"}
```
