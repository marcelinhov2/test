(function() {
  var CarsIndex,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  CarsIndex = (function() {
    function CarsIndex($scope, $state, $stateParams, carService, ngDialog) {
      this.$scope = $scope;
      this.$state = $state;
      this.$stateParams = $stateParams;
      this.carService = carService;
      this.ngDialog = ngDialog;
      this["delete"] = bind(this["delete"], this);
      this.edit = bind(this.edit, this);
      this.read = bind(this.read, this);
      this.create = bind(this.create, this);
      this.handle_selected_cars = bind(this.handle_selected_cars, this);
      this.check_all = bind(this.check_all, this);
      this.open_image = bind(this.open_image, this);
      this.open_car = bind(this.open_car, this);
      this.init = bind(this.init, this);
      this.init();
    }

    CarsIndex.prototype.init = function() {
      this.declare_scope_vars();
      this.declare_template_methods();
      return this.set_listeners();
    };

    CarsIndex.prototype.declare_scope_vars = function() {
      this.$scope.selected_cars = [];
      this.$scope.selected_all = false;
      return this.get_data();
    };

    CarsIndex.prototype.declare_template_methods = function() {
      this.$scope.create = this.create;
      this.$scope.read = this.read;
      this.$scope.edit = this.edit;
      this.$scope["delete"] = this["delete"];
      this.$scope.open_car = this.open_car;
      this.$scope.open_image = this.open_image;
      this.$scope.check_all = this.check_all;
      return this.$scope.handle_selected_cars = this.handle_selected_cars;
    };

    CarsIndex.prototype.set_listeners = function() {
      return this.$scope.$watch('rowCollection', (function(_this) {
        return function(now, was, scope) {
          return _this.$scope.selected_all = false;
        };
      })(this));
    };

    CarsIndex.prototype.get_data = function() {
      this.$scope.safe_data = this.carService.get_all();
      return this.$scope.rowCollection = angular.copy(this.$scope.safe_data);
    };

    CarsIndex.prototype.open_car = function(car) {
      return this.$state.go("App.cars.modal", {
        id: car.id,
        type: "edit"
      });
    };

    CarsIndex.prototype.open_image = function(path) {
      return this.ngDialog.open({
        className: 'ngdialog-theme-default auto',
        template: "<img src='" + path + "' />",
        plain: true
      });
    };

    CarsIndex.prototype.check_all = function() {
      return angular.forEach(this.$scope.rowCollection, (function(_this) {
        return function(item) {
          item.is_selected = _this.$scope.selected_all;
          return _this.handle_selected_cars(item);
        };
      })(this));
    };

    CarsIndex.prototype.handle_selected_cars = function(car, uncheck) {
      if (uncheck) {
        this.$scope.selected_all = false;
      }
      if (car.is_selected) {
        this.$scope.selected_cars.push(car.id);
      } else {
        this.$scope.selected_cars = _.without(this.$scope.selected_cars, car.id);
      }
      return this.$scope.selected_cars = _.uniq(this.$scope.selected_cars);
    };

    CarsIndex.prototype.create = function(car) {
      this.carService.create(car);
      return this.get_data();
    };

    CarsIndex.prototype.read = function(id) {
      return this.carService.read(id);
    };

    CarsIndex.prototype.edit = function(data) {
      this.carService.update(data);
      return this.get_data();
    };

    CarsIndex.prototype["delete"] = function() {
      var are_you_sure;
      are_you_sure = confirm('Você tem certeza que deseja deletar os carros selecionados?');
      if (are_you_sure) {
        this.carService["delete"](this.$scope.selected_cars);
        return this.declare_scope_vars();
      }
    };

    return CarsIndex;

  })();

  angular.module('app').controller('carsIndexController', ['$scope', '$state', '$stateParams', 'carService', 'ngDialog', CarsIndex]);

}).call(this);
