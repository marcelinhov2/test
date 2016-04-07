(function() {
  function App() {
    return [
      'templates', 
      'ui.router', 
      'smart-table', 
      'ngResource', 
      'ngDialog', 
      'LocalStorageModule', 
      'ui.utils.masks', 
      'cgNotify'
    ];
  }

  angular
    .module('app', new App);

})();
