alpaca_elli_example
=====

A very simple [Alpaca](http://alpaca-lang.org) example application providing two HTTP endpoints with [elli](https://github.com/knutin/elli).

In preparing for the Alpaca v0.2.8 release this has turned up a number of basic usability issues for Alpaca:

- no source annotations in the code generator output makes for a quite frustrating development and debugging experience as this means no stack traces!  This will be pretty much top of my list for v0.2.9 and I might even delay v0.2.8 for it.
- exhaustiveness checks when using pattern matching in function heads can fail when the checker tries to load a type from a module that has already been compiled.  E.g. if `elli_request.alp` has already been built successfully, exhaustiveness checks of `endpoint.alp` will throw errors because the module for `elli_request.alp` doesn't appear to be available.
- incorrect line numbers in some type errors.
- some frustrating issues around multi-arity functions and type specifications for them e.g. there appear to be problems when `handle/1` and `handle/2` both exist but only a spec for `handle/1` is available.  I haven't dug into this too deeply yet so it may be more complicated or even rather simple.

This currently uses some pending changes to the [rebar3 plugin](https://github.com/alpaca-lang/rebar_prv_alpaca) from [lepoetemaudit](https://github.com/lepoetemaudit) that allow a pre-built version of Alpaca to be used directly.

# Build and Run

You will need a local build of Alpaca, basic steps:

- clone the language repository
- build a local untagged Alpaca distribution
- set the `ALPACA_ROOT` environment variable to the location of your local Alpaca build

Here are the basic steps:

    $ git clone https://github.com/alpaca-lang/alpaca.git
	$ cd alpaca
	$ rebar3 compile
	$ bash ./make-release.sh
	$ export ALPACA_ROOT=`pwd`/alpaca-unversioned_

Then you should be able to build and run this elli example:

	$ cd $WHEREVER_YOU_CLONED_THIS_REPO
    $ rebar3 clean
	$ rebar3 release
	$ ./_build/default/rel/alpaca_elli_example/bin/alpaca_elli_example foreground
	
Then:
	
    ➜  alpaca_elli_example git:(master) ✗ curl localhost:3000/test
    Test endpoint.
	➜  alpaca_elli_example git:(master) ✗ curl localhost:3000/hello/world
	Hello, world
	➜  alpaca_elli_example git:(master) ✗ curl localhost:3000/hello/Wat
	Hello, Wat
	➜  alpaca_elli_example git:(master) ✗ curl -X PUT localhost:3000/hello/Wat
	Not found
	➜  alpaca_elli_example git:(master) ✗
