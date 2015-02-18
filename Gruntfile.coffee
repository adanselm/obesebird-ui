'use strict'

module.exports = (grunt) ->
  grunt.initConfig
    clean: [ 'build' ]

    coffeelint:
      app: ['*.coffee', 'actions/*.coffee',
            'configs/*.coffee', 'stores/*.coffee']

    concurrent:
      dev: [
        'nodemon:app'
        'webpack:dev'
      ]
      options: logConcurrentOutput: true
    nodemon: app:
      script: './server.coffee'
      options:
        ignore: [ 'build/**' ]
        ext: 'js,jsx'
    webpack: dev:
      resolve: extensions: [
        ''
        '.js'
        '.jsx'
        '.coffee'
      ]
      entry: './client.coffee'
      output:
        path: './build/js'
        publicPath: '/public/js/'
        filename: '[name].js'
      module: loaders: [
        { test: /\.css$/, loader: 'style!css' }
        { test: /\.jsx$/, loader: 'jsx-loader' }
        { test: /\.json$/, loader: 'json-loader' }
        { test: /\.coffee$/, loader: 'coffee-loader' }
      ]
      stats: colors: true
      devtool: 'source-map'
      watch: true
      keepalive: true

  # libs
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-webpack'

  # tasks
  grunt.registerTask 'default', [
    'clean'
    'coffeelint'
    'concurrent:dev'
  ]
