import Ember from "ember";

export default Ember.Controller.extend({
  actions: {
    newJoke: function() {

      const setup = this.get('setup');
      const punchline = this.get('punchline');
      const joke = this.store.createRecord('joke', {
        setup: setup,
        punchline: punchline
      });


      joke.save().then(function() {
        this.transitionTo('jokes.show', joke);
      }).catch(function(){
        this.set('validationErrors', ["Please enter in all the fields!"]);
      });
    }
  }
});
