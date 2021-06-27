FROM tarantool/tarantool:2.7.2 as builder
RUN apk add git \
   cmake \
   make \
   gcc \
   libc-dev \
   lua-dev
RUN tarantoolctl rocks install luatest
RUN tarantoolctl rocks install luacov
RUN tarantoolctl rocks build luacov-multiple
RUN tarantoolctl rocks install metrics

FROM tarantool/tarantool:2.7.2 as production
COPY --from=builder /opt/tarantool/.rocks /opt/tarantool/.rocks
RUN ln -s /opt/tarantool/.rocks/bin/luatest /bin/luatest
RUN ln -s /opt/tarantool/.rocks/bin/luacov /bin/luacov