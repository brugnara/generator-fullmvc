# generator-fullmvc [![Build Status](https://secure.travis-ci.org/brugnara/generator-fullmvc.png?branch=master)](https://travis-ci.org/brugnara/generator-fullmvc)

A generator for [Yeoman](http://yeoman.io).


## Getting Started


To install generator-fullmvc from npm, run:

```
$ npm install -g generator-fullmvc generator-fullmvc-module
```

Finally, initiate the generator and create the first module:

```
$ yo fullmvc
$ cd app/modules
$ yo fullmvc-module home
$ cd ../../
$ grunt serve
```

### modules.json

You will need to tell the application, wich module you want boot.
Please remember to add the new dep after created a new module.

```
{
  "dependencies": {
    "home" : {}
  }  
}
```

A more detailed module.json example:

```
{
  "dependencies": {
    "items" : {},
    "home": {
      "dependencies": {
        "menu": {}
      }
    }
  }  
}
```

**Note that each dependencies can have subdependencies**


## License

[MIT License](http://en.wikipedia.org/wiki/MIT_License)

## Thanks to

This awesome mvc, is possibile due this projects:

 - [RequireJS](https://github.com/jrburke/requirejs)
 - [AngularJS](https://github.com/angular/angular.js)
 - [AngularAMD](https://github.com/marcoslin/angularAMD/)
 - [Angular-UI-Bootstrap](https://github.com/angular-ui/bootstrap-bower)
 - [Bower](https://github.com/bower/bower)
 - [CoffeeScript](https://github.com/jashkenas/coffee-script)
 - [Bootstrap-SASS](https://github.com/twbs/bootstrap-sass)
 - [Yeoman](https://github.com/yeoman/yeoman/)
 - [Grunt](https://github.com/gruntjs)
 - [Angular-localizationservice](https://github.com/lavinjj/angularjs-localizationservice) (But I'm using a [forked version](https://github.com/brugnara/angularjs-localizationservice))
 - [Restangular](https://github.com/mgonto/restangular)
 - [jQuery](https://github.com/jquery/jquery)
  

