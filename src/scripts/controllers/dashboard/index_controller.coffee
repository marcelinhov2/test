class DashboardIndex extends Controller
  constructor: (
    @$scope
    @carService
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
    
    do @get_data

  declare_template_methods: ->
    @$scope.update = @update
    @$scope.delete = @delete

    @$scope.open_car = @open_car
    @$scope.open_image = @open_image
    
    @$scope.check_all = @check_all
    @$scope.handle_selected_cars = @handle_selected_cars

  set_listeners: ->
    @$scope.$watch 'rowCollection', (now, was, scope) =>
      @$scope.selected_all = false

  get_data: ->
    @$scope.safe_data = @carService.get_all()
    @$scope.rowCollection = angular.copy(@$scope.safe_data)

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
      @$scope.selected_cars.push car.id
    else
      @$scope.selected_cars = _.without(@$scope.selected_cars, car.id)

    @$scope.selected_cars = _.uniq(@$scope.selected_cars);

  update: (data) =>
    @carService.update(data)
    do @get_data

  delete: =>
    @carService.delete(@$scope.selected_cars)
    do @get_data