(function() {
  var HttpRequestInterceptor;

  HttpRequestInterceptor = (function() {
    function HttpRequestInterceptor($q, $location, $rootScope, localStorageService) {
      this.$q = $q;
      this.$location = $location;
      this.$rootScope = $rootScope;
      this.localStorageService = localStorageService;
      this.queue = [];
      return {
        request: (function(_this) {
          return function(config) {
            _this.isTemplate = config.url.indexOf('.html') > 0;
            return config;
          };
        })(this),
        requestError: (function(_this) {
          return function(rejection) {
            _this.isTemplate = rejection.config.url.indexOf('.html') > 0;
            _.remove(_this.queue, rejection.config);
            return _this.$q.reject(rejection);
          };
        })(this),
        response: (function(_this) {
          return function(response) {
            _.remove(_this.queue, response.config);
            return response || _this.$q.when(response);
          };
        })(this),
        responseError: (function(_this) {
          return function(rejection) {
            _this.isTemplate = rejection.config.url.indexOf('.html') > 0;
            _.remove(_this.queue, rejection.config);
            return _this.$q.reject(rejection);
          };
        })(this)
      };
    }

    return HttpRequestInterceptor;

  })();

  angular.module('app').factory('HttpRequestInterceptor', ['$q', '$location', '$rootScope', 'localStorageService', HttpRequestInterceptor]);

}).call(this);
