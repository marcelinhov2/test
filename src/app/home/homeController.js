(function() {
  function HomeController(
  	$scope
  ){
	function init(){
		console.log('init homeController')
		$scope.test = 'home';
	}

	init();
  }

  angular.module('app').controller('homeController', ['$scope', HomeController]);

})();
