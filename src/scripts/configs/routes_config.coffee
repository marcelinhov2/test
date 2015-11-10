class Routes extends Config
  constructor: (
    $stateProvider
    $urlRouterProvider
    $urlMatcherFactoryProvider
    $httpProvider
    $locationProvider
  ) ->
    $stateProvider
      .state 'App',
        abstract: true
        template: '<div ui-view="main"></div>'
        controller : 'appController'

      .state 
        name: 'App.cars'
        url: '/cars'
        views: 
          main:
            templateUrl : '/partials/views/cars/index.html'
            controller : 'carsIndexController'

      .state 
        name: 'App.cars.modal'
        url: '/:type/:id'
        views: 
          modal:
            controller : 'carsModalController'

    $urlRouterProvider.otherwise('/cars');
    $locationProvider.html5Mode true