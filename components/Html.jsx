'use strict';
var React = require('react');
var ApplicationStore = require('../stores/ApplicationStore');
var FluxibleMixin = require('fluxible').Mixin;

var Html = React.createClass({
    mixins: [ FluxibleMixin ],
    render: function() {
        return (
            <html>
            <head>
                <meta charSet="utf-8" />
                <title>{this.getStore(ApplicationStore).getPageTitle()}</title>
                <meta name="viewport" content="width=device-width, user-scalable=no" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.9.3/semantic.min.css" />
            </head>
            <body>
              <div className="ui page grid">
                <div className="column">
                  <div id="app" dangerouslySetInnerHTML={{__html: this.props.markup}}></div>
                </div>
              </div>
            </body>
            <script dangerouslySetInnerHTML={{__html: this.props.state}}></script>
            <script src="/public/js/main.js"></script>
            </html>
        );
    }
});

module.exports = Html;
