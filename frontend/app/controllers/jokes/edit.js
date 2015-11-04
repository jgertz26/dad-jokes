import Ember from "ember";
const alias = Ember.computed.alias;

export default Ember.Controller.extend({
  joke: alias("model"),

  actions: {
    editJoke: function() {
      var jokeId = location.pathname.split('/')[2]
      var newSetup = String(this.get('joke.setup'))
      var newPunchline = String(this.get('joke.punchline'))

      var thisPage = this

      this.store.findRecord('joke', jokeId).then(function(joke){
        joke.get('setup');
        joke.set('setup', newSetup);
        joke.get('punchline');
        joke.set('punchline', newPunchline);
        debugger;
        joke.save();
      }).then(() => {
        this.transitionToRoute('jokes.show', jokeId);
      }).catch(function(){
        thisPage.set('validationErrors', ["Please enter in all the fields!"]);
      });
    },

    deleteJoke: function() {
      var jokeId = location.pathname.split('/')[2]
      this.store.findRecord('joke', jokeId).then(function(joke) {
        joke.destroyRecord();
      });
      this.transitionToRoute('jokes');
    }
  }
});
