class DashboardModal extends Controller
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
    do @init_data

  declare_template_methods: ->
    @$scope.submit = @submit

  init_data: ->
    if @$stateParams.type is 'create'
      @$scope.car = {}

    if @$stateParams.type is 'edit'
      @$scope.car = @$scope.$parent.read(@$stateParams.id)

  open_modal: ->
    @dialog = @ngDialog.open({
      className: 'ngdialog-theme-default'
      template: "/partials/views/dashboard/modal.html"
      scope: @$scope
    });

    @dialog.closePromise.then (data) =>
      @$state.go("App.dashboard")

  submit: =>
    @$scope[@$stateParams.type](@$scope.car)
    @ngDialog.close()