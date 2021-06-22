#!/bin/sh -e

build() {
  docker build -t ma3obblu/tarantool-luatest:2.7.2 .
}

push() {
  docker tag ma3obblu/tarantool-luatest:2.7.2 ma3obblu/tarantool-luatest:2.7.2
  docker push ma3obblu/tarantool-luatest:2.7.2
}

build_and_push() {
  build
  push
}

# Добавьте сюда список команд
using(){
  echo "Укажите команду при запуске: ./run.sh [command]"
  echo "Список команд:"
  echo "  build - запустить сборку локального образа"
  echo "  push - проставить тег и выгрузить образ на docker hub"
  echo "  build_and_push - собрать локальный образ, поставить тег и выгрузить на docker hub"
}

command="$1"
if [ -z "$command" ]
then
 using
 exit 0;
else
 $command $@
fi
