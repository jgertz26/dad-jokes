import Ember from "ember";

export default Ember.Controller.extend({
  actions: {
    newJoke: function() {

      var setup = this.get('setup');
      var punchline = this.get('punchline');
      var joke = this.store.createRecord('joke', {
        setup: setup,
        punchline: punchline
      });
      debugger;
      joke.save().then(function() {
        this.transitionTo('jokes.show', joke);
      })
    }
  }
});
