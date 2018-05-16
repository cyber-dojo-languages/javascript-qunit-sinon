'use strict';

const hiker = require('./hiker.js');

QUnit.test('answer', function(assert) {
    assert.equal(hiker.answer(), 42, 'to life the universe and everything');
});
