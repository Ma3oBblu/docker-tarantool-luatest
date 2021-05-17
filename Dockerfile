FROM tarantool/tarantool:2.6.2

RUN apk add git \
   cmake \
   make \
   gcc

RUN tarantoolctl rocks install luatest
RUN ln -s /opt/tarantool/.rocks/bin/luatest /bin/luatest