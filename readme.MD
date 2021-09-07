# Docker image for tarantool with luatest, luacov and metrics

Used original image from tarantool repo [official tarantool docker image 2.8.2](https://hub.docker.com/r/tarantool/tarantool/)

In image added useful modules:
* [luatest](https://github.com/tarantool/luatest) for testing
  
* [luacov](https://github.com/keplerproject/luacov) to analyze test coverage

* [luacov-multiple](https://github.com/to-kr/luacov-multiple) for html report for test coverage

* [metrics](https://github.com/tarantool/metrics) for metrics

Use command to build local image:
`docker build -t ma3obblu/tarantool-luatest:2.8.2 .`

## Examples

### Run tests
```bash
unit() {
    echo "run unit tests"
    docker run -v $(pwd):/work:rw -w /work/src ma3obblu/tarantool-luatest:2.8.2 luatest -v
}
```

### Run test coverage
```bash
unit_coverage(){
  echo "run unit tests"
  docker run -v $(pwd):/work:rw -w /work/src ma3obblu/tarantool-luatest:2.8.2 luatest --coverage
  docker run -v $(pwd):/work:rw -w /work/src ma3obblu/tarantool-luatest:2.8.2 luacov .
  grep -A999 '^Summary' ./src/luacov.report.out
  rm -f ./src/luacov.*.out*
}
```

## Links
- [About luatest](https://www.tarantool.io/ru/doc/latest/reference/reference_rock/luatest/luatest_overview/)
- [Video about CI/CD for tarantool](https://youtu.be/heXXvlmADNA)