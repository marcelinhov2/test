(function() {
  function Routes($stateProvider, $urlRouterProvider, $urlMatcherFactoryProvider, $httpProvider, $locationProvider) {
    $stateProvider
      .state('App', {
        abstract: true,
        template: '<div ui-view="main"></div>',
        controller: 'appController'
      })
      .state({
        name: 'App.home',
        url: '/home',
        views: {
          main: {
            templateUrl: '/app/home/homeTemplate.html',
            controller: 'homeController'
          }
        }
      })

    $urlRouterProvider.otherwise('/home');
    $locationProvider.html5Mode(true);
  }

  angular.module('app').config(['$stateProvider', '$urlRouterProvider', '$urlMatcherFactoryProvider', '$httpProvider', '$locationProvider', Routes]);

}).call(this);