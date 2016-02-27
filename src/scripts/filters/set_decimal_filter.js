(function() {
  var SetDecimal;

  SetDecimal = (function() {
    function SetDecimal($filter) {
      this.$filter = $filter;
      return function(num, fixed) {
        var array, decimalPart, index;
        decimalPart = void 0;
        array = Math.floor(num).toString().split("");
        index = -3;
        while (array.length + index > 0) {
          array.splice(index, 0, ".");
          index -= 4;
        }
        if (fixed > 0) {
          decimalPart = num.toFixed(fixed).split(".")[1];
          return array.join("") + "," + decimalPart;
        }
        return array.join("");
      };
    }

    return SetDecimal;

  })();

  angular.module('app').filter('setDecimal', ['$filter', SetDecimal]);

}).call(this);
