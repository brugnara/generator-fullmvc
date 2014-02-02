'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');


var FullmvcGenerator = module.exports = function FullmvcGenerator(args, options, config) {
  yeoman.generators.Base.apply(this, arguments);

  this.on('end', function () {
    this.installDependencies({ skipInstall: options['skip-install'] });
  });

  this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
};

util.inherits(FullmvcGenerator, yeoman.generators.Base);

FullmvcGenerator.prototype.askFor = function askFor() {
  var cb = this.async();

  // have Yeoman greet the user.
  console.log(this.yeoman);

  var prompts = [];

  this.prompt(prompts, function (props) {
    this.someOption = props.someOption;

    cb();
  }.bind(this));
};

FullmvcGenerator.prototype.app = function app() {
  this.directory('base/app', 'app');
  this.directory('base/test', 'test');
  //
  this.copy('base/bowerrc', '.bowerrc');
  this.copy('base/bower.json', 'bower.json');
  this.copy('base/Gruntfile.js', 'Gruntfile.js');
  this.copy('base/package.json', 'package.json');
  this.copy('base/README.md', 'README.md');
};

FullmvcGenerator.prototype.projectfiles = function projectfiles() {
  this.copy('base/editorconfig', '.editorconfig');
  this.copy('base/jshintrc', '.jshintrc');
  this.copy('base/gitattributes', '.gitattributes');
  this.copy('base/gitignore', '.gitignore');
};
