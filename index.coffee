MuxDemux = require 'mux-demux'
through = require 'through'


LogStream = through (data) =>
  console.log "The Amazing LogStream got: #{data}"

LogStream2 = through (data) =>
  console.log "The Amazinger LogStream2 got: #{data}"
  
process.stdin.pipe LogStream
process.stdin.pipe LogStream2