MuxDemux = require 'mux-demux'
through = require 'through'
{Readable, Writable} = require 'stream'

LogStream = through (data) =>
  console.log "The Amazing LogStream got: #{data}"

LogStream2 = through (data) =>
  console.log "The Amazinger LogStream2 got: #{data}"
  
process.stdin.pipe LogStream
process.stdin.pipe LogStream2


class RandomNode extends Readable
  constructor: ->
    # super objectMode: true
    super()
  
  _read: () =>
    @push Math.random() + ''



r = new RandomNode

r.pipe process.stdout