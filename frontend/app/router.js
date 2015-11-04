import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('jokes', function() {
    this.route('show', { path: ':joke_id' });
    this.route('new');
    this.route('edit', { path: ':joke_id/edit' });
    this.route('delete', { path: ':joke_id/delete' });
  });
});

export default Router;
