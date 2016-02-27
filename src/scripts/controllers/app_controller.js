(function() {
  var App,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  App = (function() {
    function App($scope) {
      this.$scope = $scope;
      this.init = bind(this.init, this);
      this.init();
    }

    App.prototype.init = function() {
      return this.$scope.test = 'teste';
    };

    return App;

  })();

  angular.module('app').controller('appController', ['$scope', App]);

}).call(this);
