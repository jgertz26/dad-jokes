import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    model(params) {
      return this.store.find('joke', params.joke_id);
    },

    willTransition() {
      const controller = this.get('controller');
      controller.set('validationErrors', false);
      controller.set('setup', "");
      controller.set('punchline', "");
      }
    }
});
