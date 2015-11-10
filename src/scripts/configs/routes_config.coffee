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
        name: 'App.dashboard'
        url: '/dashboard'
        views: 
          main:
            templateUrl : '/partials/views/dashboard/index.html'
            controller : 'dashboardIndexController'

      .state 
        name: 'App.dashboard.modal'
        url: '/:type/:id'
        views: 
          modal:
            controller : 'dashboardModalController'

    $urlRouterProvider.otherwise('/dashboard');
    $locationProvider.html5Mode true