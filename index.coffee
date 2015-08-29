MuxDemux = require 'mux-demux'
through = require 'through'
{Readable, Writable} = require 'stream'

LogStream = through (data) =>
  console.log "The Amazing LogStream got: #{data}"

LogStream2 = through (data) =>
  console.log "The Amazinger LogStream2 got: #{data}"
  
#process.stdin.pipe LogStream
#process.stdin.pipe LogStream2


class RandomNode extends Readable
  constructor: ->
    @n = 0
    # super objectMode: true
    setInterval (=> @push @n++ + '\n'), 1000    
    super()
  
  _read: () =>
    



r = new RandomNode

r.pipe process.stdout

setTimeout (=> r.pipe LogStream), 5000

setTimeout (=> r.pipe LogStream2), 10000

setTimeout (=> r.unpipe LogStream2), 12000
setTimeout (=> r.unpipe LogStream), 14000
setTimeout (=> r.unpipe process.stdout), 14000

setTimeout (=> r.pipe process.stdout), 20000