import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: 'auto',
  rootURL: '/'
});

Router.map(function() {
  this.route('shopper');
  this.route('shopper', { path: '/shopper/:email' });
});

export default Router;
