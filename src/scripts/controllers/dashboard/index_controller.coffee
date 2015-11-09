class DashboardIndex extends Controller
  constructor: (
    @$scope
    @ngDialog
  ) -> do @init
    
  init: =>
    do @declare_scope_vars
    do @declare_template_methods
    do @set_listeners

  declare_scope_vars: ->
    @$scope.itemsByPage = 5
    
    @$scope.safe_data = [  
      {
        "combustivel":"Flex",
        "imagem":null,
        "marca":"Volkswagem",
        "modelo":"Gol",
        "placa":"FFF­5498",
        "valor":"20000"
      }
      {
        "combustivel":"Gasolina",
        "imagem":null,
        "marca":"Volkswagem",
        "modelo":"Fox",
        "placa":"FOX­4125",
        "valor":"20000"
      }
      {
        "combustivel":"Alcool",
        "imagem":"http://placehold.it/350x150",
        "marca":"Volkswagen",
        "modelo":"Fusca",
        "placa":"PAI­4121",
        "valor":"20000"
      }
    ]

    @$scope.rowCollection = angular.copy(@$scope.safe_data)

    console.log 'declare_scope_vars'

  declare_template_methods: ->
    @$scope.open_car = @open_car
    @$scope.open_image = @open_image

  set_listeners: ->
    console.log 'set_listeners'

  open_car: (car) =>
    @ngDialog.open({
      className: 'ngdialog-theme-default'
      template: "/partials/views/dashboard/modal.html"
      controller : 'dashboardModalController'
      scope: @$scope
      data: (car) ? car : null
    });

  open_image: (path) =>
    console.log path

    @ngDialog.open({
      className: 'ngdialog-theme-default auto'
      template:
        "<img src='#{path}' />"
      plain: true
    });