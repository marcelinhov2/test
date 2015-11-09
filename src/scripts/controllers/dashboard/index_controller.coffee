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
    @$scope.selected_cars = []
    @$scope.selected_all = false

    @$scope.itemsByPage = 5
    
    @$scope.safe_data = [  
      {
        "combustivel":"Flex",
        "imagem":null,
        "marca":"Volkswagem",
        "modelo":"Gol",
        "placa":"FFF­5498",
        "valor":10000
      }
      {
        "combustivel":"Gasolina",
        "imagem":null,
        "marca":"Volkswagem",
        "modelo":"Fox",
        "placa":"FOX­4125",
        "valor":20000
      }
      {
        "combustivel":"Alcool",
        "imagem":"http://placehold.it/350x150",
        "marca":"Volkswagen",
        "modelo":"Fusca",
        "placa":"PAI­4121",
        "valor":30000
      }
      {
        "combustivel":"Flex",
        "imagem":null,
        "marca":"Volkswagem",
        "modelo":"Gol",
        "placa":"1FFF­5498",
        "valor":10000
      }
      {
        "combustivel":"Gasolina",
        "imagem":null,
        "marca":"Volkswagem",
        "modelo":"Fox",
        "placa":"1FOX­4125",
        "valor":20000
      }
      {
        "combustivel":"Alcool",
        "imagem":"http://placehold.it/350x150",
        "marca":"Volkswagen",
        "modelo":"Fusca",
        "placa":"1PAI­4121",
        "valor":30000
      }
      {
        "combustivel":"Flex",
        "imagem":null,
        "marca":"Volkswagem",
        "modelo":"Gol",
        "placa":"2FFF­5498",
        "valor":10000
      }
      {
        "combustivel":"Gasolina",
        "imagem":null,
        "marca":"Volkswagem",
        "modelo":"Fox",
        "placa":"2FOX­4125",
        "valor":20000
      }
      {
        "combustivel":"Alcool",
        "imagem":"http://placehold.it/350x150",
        "marca":"Volkswagen",
        "modelo":"Fusca",
        "placa":"2PAI­4121",
        "valor":30000
      }
      {
        "combustivel":"Flex",
        "imagem":null,
        "marca":"Volkswagem",
        "modelo":"Gol",
        "placa":"3FFF­5498",
        "valor":10000
      }
      {
        "combustivel":"Gasolina",
        "imagem":null,
        "marca":"Volkswagem",
        "modelo":"Fox",
        "placa":"3FOX­4125",
        "valor":20000
      }
      {
        "combustivel":"Alcool",
        "imagem":"http://placehold.it/350x150",
        "marca":"Volkswagen",
        "modelo":"Fusca",
        "placa":"3PAI­4121",
        "valor":30000
      }
    ]

    @$scope.rowCollection = angular.copy(@$scope.safe_data)

  declare_template_methods: ->
    @$scope.open_car = @open_car
    @$scope.open_image = @open_image
    
    @$scope.check_all = @check_all
    @$scope.handle_selected_cars = @handle_selected_cars

  set_listeners: ->
    @$scope.$watch 'rowCollection', (now, was, scope) =>
      @$scope.selected_all = false

  open_car: (car) =>
    @ngDialog.open({
      className: 'ngdialog-theme-default'
      template: "/partials/views/dashboard/modal.html"
      controller : 'dashboardModalController'
      scope: @$scope
      data: (car) ? car : null
    });

  open_image: (path) =>
    @ngDialog.open({
      className: 'ngdialog-theme-default auto'
      template:
        "<img src='#{path}' />"
      plain: true
    });

  check_all: =>
    angular.forEach @$scope.rowCollection, (item) =>
      item.is_selected = @$scope.selected_all
      @handle_selected_cars(item)

  handle_selected_cars: (car, uncheck) =>
    if uncheck
      @$scope.selected_all = false

    if car.is_selected
      @$scope.selected_cars.push car.placa
    else
      @$scope.selected_cars = _.without(@$scope.selected_cars, car.placa)