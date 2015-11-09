class Pagination extends Directive
  constructor: ->
    return {
      restrict: 'E'
      templateUrl: '/partials/directives/pagination.html'
      link: (scope, element, attrs) ->
        console.log "pagination link directive"
    }