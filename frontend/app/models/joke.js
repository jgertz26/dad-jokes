import DS from 'ember-data';

export default DS.Model.extend({
  setup: DS.attr('string'),
  punchline: DS.attr('string'),
  rating: DS.attr('number')
});
