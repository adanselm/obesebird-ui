Obesebird: a tweet scheduler / isomorphic coffeescript tutorial
===================

This is a small sample app built to demonstrate isomorphic javascript concepts
using:

* [Coffeescript](http://coffeescript.org/) much more concise than javascript
* [React](https://github.com/facebook/react) (UI components)
* [Fluxible](http://fluxible.io/) (Flux architecture)
* On top of a basic [Express](https://github.com/visionmedia/express) server app.

We use [Webpack](http://webpack.github.io/) and [Grunt](http://gruntjs.com/) to
package our server-side CommonJS modules in a way that allows us to use them in
the client-side.

## Overview

This started as an exercise to understand modern front-end architecture. After
retracing its evolution in my
[blog post](http://adanselm.github.io/c++/programming/2015/01/31/web-apps-for-cpp-programmers.html),
I realized that most examples on the web are (already) outdated.

You can read about the principles of isomorphic JavaScript apps (that can run
on both client and server) on AirBnb's [blog](http://nerds.airbnb.com/isomorphic-javascript-future-web-apps/).

## Functionalities

Obesebird is the UI part for an app that will schedule tweets for you.

* Create new tweets in each category
* Browse the existing tweets
* Schedule a category for a given timeslot

The backend will be responsible to do the actual business...

## Getting it running

### Install Node.js >= 0.10.x

If Node.js version 0.10.x is not already installed on your system, install it so you can run this app.

#### Check if it's installed

The command `which node` will return a path to your installed version of Node.js, if it exists on your system.

    $ which node
    /usr/local/bin/node

If it is installed, make sure it's at least version 0.8.x, and preferably 0.10.x.

    $ node --version
    v0.10.33

#### To install

##### Mac

Preferably install using Homebrew:

    $ brew install node

##### Else

Otherwise, go to the [nodejs.org](http://nodejs.org/) and download the binary to install on your system.

### Install `grunt-cli` and `coffeescript`

This app uses [Grunt](http://gruntjs.com/) to build its assets. To run Grunt, we need to install the `grunt-cli` package globally on your system using NPM.

    $ npm install -g grunt-cli
    $ npm install -g coffee-script

### Clone this repo onto your machine

    $ git clone git@github.com:adanselm/obesebird-ui.git
    $ cd obesebird-ui

### Run `npm install` to install dependenices

	$ npm install
    ...

### Run the app!

We'll start up our local Node.js web server using Grunt, so it can automatically do useful things for us when we change files like recompile our assets and restart the server.

    $ grunt

This will start our local web server on port `3000`.

You can view it in your web browser at `http://localhost:3000/`

## License

MIT

