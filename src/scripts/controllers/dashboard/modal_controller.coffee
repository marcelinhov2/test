class DashboardModal extends Controller
  constructor: (
    @$scope
  ) -> do @init
    
  init: =>
    do @declare_scope_vars

  declare_scope_vars: ->
    @$scope.car = if (@$scope.ngDialogData.car isnt null) then @$scope.ngDialogData else {}