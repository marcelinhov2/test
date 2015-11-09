class App extends Controller
  constructor: (
    @$scope
  ) -> do @init
    
  init: =>
    console.log '--------------------'
    console.log 'init app'
    console.log '--------------------'