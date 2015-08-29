#example from http://blog.jeroenpelgrims.be/node-streams-in-coffeescript/
stream = require 'stream'

class CharStream extends stream.Readable  
    constructor: (@s) ->
        super

    _read: ->
        for c in @s
            @push c
        @push null

class UpperCaseStream extends stream.Transform  
    _transform: (chunk, enc, next) ->
        @push chunk.toString().toUpperCase()
        next()

class LogStream extends stream.Writable  
    _write: (chunk, enc, next) ->
        console.log chunk.toString()
        next()


new CharStream 'ab c'  
    .pipe new UpperCaseStream
    .pipe new LogStream