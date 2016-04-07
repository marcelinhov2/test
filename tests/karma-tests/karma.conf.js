module.exports = function(config){
  config.set({

    basePath : '../../',

    files : [
      'www/scripts/dependencies.js',
      'www/scripts/main.js',
      'www/scripts/templates.js',
      'tests/karma-tests/app/**/*.js'
    ],

    autoWatch : false,
    singleRun: true,

    frameworks: [ 'jasmine' ],

    browsers : [ 'PhantomJS' ],

    plugins : ['karma-jasmine', 'karma-phantomjs-launcher']

  });
};
