(function() {
  var CarsModal,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  CarsModal = (function() {
    function CarsModal($scope, $state, $stateParams, ngDialog) {
      this.$scope = $scope;
      this.$state = $state;
      this.$stateParams = $stateParams;
      this.ngDialog = ngDialog;
      this.submit = bind(this.submit, this);
      this.init = bind(this.init, this);
      this.init();
    }

    CarsModal.prototype.init = function() {
      this.declare_scope_vars();
      this.declare_template_methods();
      return this.open_modal();
    };

    CarsModal.prototype.declare_scope_vars = function() {
      this.$scope.type = this.$stateParams.type;
      return this.init_data();
    };

    CarsModal.prototype.declare_template_methods = function() {
      return this.$scope.submit = this.submit;
    };

    CarsModal.prototype.init_data = function() {
      if (this.$scope.type === 'create') {
        this.$scope.car = {};
      }
      if (this.$scope.type === 'edit') {
        return this.$scope.car = this.$scope.$parent.read(parseInt(this.$stateParams.id));
      }
    };

    CarsModal.prototype.open_modal = function() {
      this.dialog = this.ngDialog.open({
        className: 'ngdialog-theme-default',
        template: "/partials/views/cars/modal.html",
        scope: this.$scope
      });
      return this.dialog.closePromise.then((function(_this) {
        return function(data) {
          return _this.$state.go("App.cars");
        };
      })(this));
    };

    CarsModal.prototype.submit = function() {
      this.$scope[this.$scope.type](this.$scope.car);
      return this.ngDialog.close();
    };

    return CarsModal;

  })();

  angular.module('app').controller('carsModalController', ['$scope', '$state', '$stateParams', 'ngDialog', CarsModal]);

}).call(this);
