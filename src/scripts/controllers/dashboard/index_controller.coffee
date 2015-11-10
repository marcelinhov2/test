class DashboardIndex extends Controller
  constructor: (
    @$scope
    @$state
    @$stateParams
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
    
    do @get_data

  declare_template_methods: ->
    @$scope.create = @create
    @$scope.read = @read
    @$scope.edit = @edit
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
    @$state.go("App.dashboard.modal", {id: car.id, type: "edit"})

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

  create: (car) =>
    @carService.create(car)
    do @get_data

  read: (id) =>
    return @carService.read(id)

  edit: (data) =>
    @carService.update(data)
    do @get_data

  delete: =>
    are_you_sure = confirm('Você tem certeza que deseja deletar os carros selecionados?')
    
    if are_you_sure
      @carService.delete(@$scope.selected_cars)
      do @declare_scope_vars