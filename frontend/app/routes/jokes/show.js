import Ember from 'ember';
export default Ember.Route.extend({
  queryParams: {
    refreshPage: {
      refreshModel: true
    }
  },
  model(params) {
    return this.store.find('joke', params.joke_id);
  }
});
