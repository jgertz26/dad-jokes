import Ember from 'ember';

export function formatSetup(params/*, hash*/) {
  var string = params[0].slice(0, 40)

  if (params[0].length > 40) {
    string = string.concat("...")
  };
  return string
}

export default Ember.Helper.helper(formatSetup);
