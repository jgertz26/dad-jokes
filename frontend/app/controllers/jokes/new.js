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

      var thisPage = this

      joke.save().then(() => {
        this.transitionToRoute('jokes.show', joke);
      }).catch(function(){
        thisPage.set('validationErrors', ["Please enter in all the fields!"]);
      });
    }
  }
});
