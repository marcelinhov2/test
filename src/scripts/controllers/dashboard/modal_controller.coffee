class DashboardModal extends Controller
  constructor: (
    @$scope
    @$state
    @$stateParams
    @ngDialog
  ) -> do @init
    
  init: =>
    console.log 'init modal'

    do @declare_scope_vars
    do @open_modal

  declare_scope_vars: ->
    do @init_data

    console.log @$scope.car

  init_data: ->
    if @$stateParams.type is 'create'
      @$scope.car = {}

    if @$stateParams.type is 'edit'
      @$scope.car = @$scope.$parent.read(@$stateParams.id)

  open_modal: ->
    @dialog = @ngDialog.open({
      className: 'ngdialog-theme-default'
      template: "/partials/views/dashboard/modal.html"
    });

    @dialog.closePromise.then (data) =>
      @$state.go("App.dashboard")