'use strict';
var React = require('react');

var Home = React.createClass({
    getInitialState: function () {
        return {};
    },
    render: function() {
        return (
            <div className="ui large message">
              <h1>Welcome to ObeseBird!</h1>
              <p>This is a twitter posts scheduler.</p>
              <ul>
                <li>Create a bunch of tweets</li>
                <li>Sort them by categories</li>
                <li>Decide when to publish a category</li>
              </ul>
            </div>
        );
    }
});

module.exports = Home;
