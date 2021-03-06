siml = require 'siml'
path = require 'path'
fs = require 'fs'
_ = require 'underscore'

module.exports = (wintersmith, callback) ->

  ws = wintersmith

  _.templateSettings =
    'interpolate' : /\{\{(.+?)\}\}/g

  simlOptions =
    'indent' : '  '
    'pretty' : true
    'curly' : false

  class SimlTemplate extends ws.TemplatePlugin

    constructor: ( @template ) ->
      @template

    render: ( locals, callback ) ->
      try
        locals.locals = locals
        callback null, new Buffer @template locals
      catch error
        callback error

  SimlTemplate.fromFile = ( filename, callback ) ->
    fs.readFile filename.full, encoding: 'utf-8', (error, contents) ->
      return callback(error) if error
      try
        # Parse SIML.
        template = siml.parse contents, simlOptions

        # Create Underscore template function.
        template = _.template template

        # Call the callback with a new SimlTemplate.
        callback null, new SimlTemplate template
      catch error
        callback error

  ws.registerTemplatePlugin '**/*.siml', SimlTemplate
  callback()
