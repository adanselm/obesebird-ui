'use strict';
var React = require('react');
var NavLink = require('flux-router-component').NavLink;

var Nav = React.createClass({
    getDefaultProps: function () {
        return {
            selected: 'home',
            links: {}
        };
    },
    render: function() {
        var selected = this.props.selected;
        var links = this.props.links;

        var linkHTML = Object.keys(links).map(function (name) {
            var className = 'item';
            var link = links[name];

            if (selected === name) {
                className = 'active item';
            }

            return (
                <li className={className} key={link.path}>
                    <NavLink href={link.url}>{link.title}</NavLink>
                </li>
            );
        });

        return (
            <ul className="ui large secondary pointing menu">
                {linkHTML}
            </ul>
        );
    }
});

module.exports = Nav;
