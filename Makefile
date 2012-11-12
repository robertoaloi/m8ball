.PHONY: rel deps

all: deps compile

deps:
	./rebar get-deps

compile:
	./rebar compile

rel: deps compile relclean
	./rebar generate overlay_vars=`PWD`/rel/files/sample-vars-standalone.config

rel_all: deps compile relclean rel_a rel_b rel_c

rel_a:
	./rebar generate overlay_vars=`PWD`/rel/files/sample-vars-a.config
	mv rel/m8ball rel/m8ball-a

rel_b:
	./rebar generate overlay_vars=`PWD`/rel/files/sample-vars-b.config
	mv rel/m8ball rel/m8ball-b

rel_c:
	./rebar generate overlay_vars=`PWD`/rel/files/sample-vars-c.config
	mv rel/m8ball rel/m8ball-c

clean:
	./rebar clean

distclean: clean relclean
	./rebar delete-deps

relclean:
	rm -rf rel/m8ball rel/m8ball-a rel/m8ball-b rel/m8ball-c

console:
	rel/m8ball/bin/m8ball console

console_a:
	rel/m8ball-a/bin/m8ball console

console_b:
	rel/m8ball-b/bin/m8ball console

console_c:
	rel/m8ball-c/bin/m8ball console

start:
	rel/m8ball/bin/m8ball start

start_all: start_a start_b start_c

start_a:
	rel/m8ball-a/bin/m8ball start

start_b:
	rel/m8ball-b/bin/m8ball start

start_c:
	rel/m8ball-c/bin/m8ball start

ping:
	-rel/m8ball/bin/m8ball ping

ping_all: ping_a ping_b ping_c

ping_a:
	-rel/m8ball-a/bin/m8ball ping

ping_b:
	-rel/m8ball-b/bin/m8ball ping

ping_c:
	-rel/m8ball-c/bin/m8ball ping

attach:
	rel/m8ball/bin/m8ball attach

attach_a:
	rel/m8ball-a/bin/m8ball attach

attach_b:
	rel/m8ball-b/bin/m8ball attach

attach_c:
	rel/m8ball-c/bin/m8ball attach

stop:
	-rel/m8ball/bin/m8ball stop

stop_all: stop_a stop_b stop_c

stop_a:
	-rel/m8ball-a/bin/m8ball stop

stop_b:
	-rel/m8ball-b/bin/m8ball stop

stop_c:
	-rel/m8ball-c/bin/m8ball stop

hard_stop:
	killall beam.smp
