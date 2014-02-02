'use strict';

describe('Service: Sub', function () {

  // load the service's module
  beforeEach(module('testsApp'));

  // instantiate service
  var Sub;
  beforeEach(inject(function (_Sub_) {
    Sub = _Sub_;
  }));

  it('should do something', function () {
    expect(!!Sub).toBe(true);
  });

});
