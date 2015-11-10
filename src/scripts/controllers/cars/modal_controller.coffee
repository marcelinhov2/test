class CarsModal extends Controller
  constructor: (
    @$scope
    @$state
    @$stateParams
    @ngDialog
  ) -> do @init
    
  init: =>
    do @declare_scope_vars
    do @declare_template_methods
    do @open_modal

  declare_scope_vars: ->
    @$scope.type = @$stateParams.type
    do @init_data

  declare_template_methods: ->
    @$scope.submit = @submit

  init_data: ->
    if @$scope.type is 'create'
      @$scope.car = {}

    if @$scope.type is 'edit'
      @$scope.car = @$scope.$parent.read(@$stateParams.id)

  open_modal: ->
    @dialog = @ngDialog.open({
      className: 'ngdialog-theme-default'
      template: "/partials/views/cars/modal.html"
      scope: @$scope
    });

    @dialog.closePromise.then (data) =>
      @$state.go("App.cars")

  submit: =>
    @$scope[@$scope.type](@$scope.car)
    @ngDialog.close()