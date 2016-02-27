describe("Car Service", function () {

    var service;

    beforeEach(module('app'));
    beforeEach(inject(function (carService) {
        service = carService;
    }));

    it("check service", function () {
      console.log(service);
      expect(true).toBe(true);        
    });
});