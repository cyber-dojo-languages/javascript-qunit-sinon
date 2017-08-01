'use strict';

let answer = require('./hiker.js');

QUnit.test("answer", function(assert) {
    assert.equal(answer(), 42, "to life the universe and everything");
});
