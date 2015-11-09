class Search extends Directive
  constructor: ->
    return {
      restrict: 'E'
      templateUrl: '/partials/directives/search.html'
      link: (scope, element, attrs) ->
        console.log "search link directive"
    }