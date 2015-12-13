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

  `./bin/bench`

  

## Acknowledgement

Gotta give a shout out to [Luca Guidi](http://lucaguidi.com) for all the work he's done in this space!
