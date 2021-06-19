FROM tarantool/tarantool:2.6.3

RUN apk add git \
   cmake \
   make \
   gcc \
   libc-dev \
   lua-dev

RUN tarantoolctl rocks install luatest
RUN ln -s /opt/tarantool/.rocks/bin/luatest /bin/luatest
RUN tarantoolctl rocks install luacov
RUN ln -s /opt/tarantool/.rocks/bin/luacov /bin/luacov
RUN tarantoolctl rocks build luacov-multiple