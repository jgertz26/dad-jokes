import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    willTransition() {
      const controller = this.get('controller');
      controller.set('validationErrors', false);
      controller.set('setup', "");
      controller.set('punchline', "");
    }
  }
});
