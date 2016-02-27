(function() {
  var Car,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Car = (function() {
    function Car(cars, localStorageService, notify) {
      this.cars = cars;
      this.localStorageService = localStorageService;
      this.notify = notify;
      this.success_message = bind(this.success_message, this);
      this["delete"] = bind(this["delete"], this);
      this.update = bind(this.update, this);
      this.read = bind(this.read, this);
      this.create = bind(this.create, this);
      this.write = bind(this.write, this);
      this.get_all = bind(this.get_all, this);
      this.cars = this.get_all();
      return {
        get_all: this.get_all,
        create: this.create,
        read: this.read,
        update: this.update,
        "delete": this["delete"]
      };
    }

    Car.prototype.get_all = function() {
      return this.localStorageService.get('cars') || this.cars;
    };

    Car.prototype.write = function() {
      this.localStorageService.set('cars', this.cars);
      return this.success_message();
    };

    Car.prototype.create = function(data) {
      data.id = this.localStorageService.get('cars_next_id') || _.uniqueId();
      data.id = parseInt(data.id);
      this.cars.unshift(data);
      this.localStorageService.set('cars_next_id', data.id + 1);
      return this.write();
    };

    Car.prototype.read = function(id) {
      return _.find(this.cars, {
        id: id
      });
    };

    Car.prototype.update = function(data) {
      var car;
      car = _.find(this.cars, {
        id: data.id
      });
      car = _.merge(car, data);
      return this.write();
    };

    Car.prototype["delete"] = function(ids) {
      var i;
      i = 0;
      while (i < ids.length) {
        this.cars = _.reject(this.cars, {
          id: ids[i]
        });
        i++;
      }
      return this.write();
    };

    Car.prototype.success_message = function() {
      return this.notify({
        message: "Dados atualizados com sucesso!",
        duration: 3000
      });
    };

    return Car;

  })();

  angular.module('app').service('carService', ['cars', 'localStorageService', 'notify', Car]);

}).call(this);
