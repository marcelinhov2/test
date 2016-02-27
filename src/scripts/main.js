(function() {
  var App;

  App = (function() {
    function App() {
      return ['templates', 'ui.router', 'smart-table', 'ngResource', 'ngDialog', 'LocalStorageModule', 'ui.utils.masks', 'cgNotify'];
    }

    return App;

  })();

  angular.module('app', new App());

}).call(this);
