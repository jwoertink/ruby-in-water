# Ruby in Water

This is a sample app based on [this article](http://lucaguidi.com/2015/12/09/25000-requests-per-second-for-rack-json-api-with-mruby.html) about 25,000+ Req/s for Rack JSON API with MRuby. Most of this code is based off of [this repo](https://github.com/jodosha/mruby-rack-json-api), but with a few modified things to try a more [sinatra](http://www.sinatrarb.com/) like app. This uses [MRuby](http://mruby.org), [Rack](http://rack.github.io/), [Redis](http://redis.io) and [H2O](https://h2o.examp1e.net/).

## Prerequisites

  * gcc `brew install gcc`
  * cmake `brew install cmake`
  * wrk (for benchmarks) `brew install wrk`
  * Redis `brew install redis`

## Install

  `./bin/install`

## Running

  `./bin/server`

## Benchmarks
  First start your server, then open a second tab and run

  `./bin/bench`

```text
ruby-in-water (master)$ bin/bench
Measuring /
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   227.44us   54.09us   2.89ms   88.15%
    Req/Sec    21.75k   288.47    22.49k    64.50%
  432749 requests in 10.00s, 79.24MB read
Requests/sec:  43274.32
Transfer/sec:    7.92MB
```

This example shows that I benchmarked the home page and got *43,274* req/sec.

## Acknowledgement

Gotta give a shout out to [Luca Guidi](http://lucaguidi.com) for all the work he's done in this space!
