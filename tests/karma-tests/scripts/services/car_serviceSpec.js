describe("Car Service", function () {

    var service;

    beforeEach(module('app'));
    beforeEach(inject(function (carService) {
        service = carService;
    }));

    it("check service", function () {
      expect(true).toBe(true);        
    });
});