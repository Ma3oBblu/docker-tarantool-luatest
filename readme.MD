# Docker образ tarantool с пакетами для тестирования и сбора метрик

За основу используется [официальный докер образ tarantool 2.8.2](https://hub.docker.com/r/tarantool/tarantool/)

Добавлены библиотеки:
* [luatest](https://github.com/tarantool/luatest) для тестирования
  
* [luacov](https://github.com/keplerproject/luacov) для анализа покрытия тестами

* [luacov-multiple](https://github.com/to-kr/luacov-multiple) для вывода html отчета по покрытию

* [metrics](https://github.com/tarantool/metrics) для сбора и предоставления метрик приложения

Для сборки локального образа используйте команду:
`docker build -t ma3obblu/tarantool-luatest:2.8.2 .`

## Примеры использования

### Запуск тестов
```bash
unit() {
    echo "run unit tests"
    docker run -v $(pwd):/work:rw -w /work/src ma3obblu/tarantool-luatest:2.8.2 luatest -v
}
```

### Анализ покрытия
```bash
unit_coverage(){
  echo "run unit tests"
  docker run -v $(pwd):/work:rw -w /work/src ma3obblu/tarantool-luatest:2.8.2 luatest --coverage
  docker run -v $(pwd):/work:rw -w /work/src ma3obblu/tarantool-luatest:2.8.2 luacov .
  grep -A999 '^Summary' ./src/luacov.report.out
  rm -f ./src/luacov.*.out*
}
```

## Ссылки
- [Описание пакета luatest](https://www.tarantool.io/ru/doc/latest/reference/reference_rock/luatest/luatest_overview/)
- [Доклад на тему CI/CD для tarantool](https://youtu.be/heXXvlmADNA)