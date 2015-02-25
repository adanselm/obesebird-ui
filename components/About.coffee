'use strict'
React = require 'react'

{h1, p, a, div} = React.DOM

module.exports = React.createClass

  getInitialState: ->
    {}

  render: ->
    div null,
      h1 null,
        "About"
      p null,
        "This app was created as an exercise to show Cpp or ObjC
        developers how to code web apps in comparison to what they are
        used to do for mobile or desktop apps."
      p null,
        a
          href: "http://adanselm.github.io/c++/programming/2015/02/03/\
          web-apps-for-cpp-programmers.html"
          "Follow the serie of articles documenting this process on my blog."

