import Controller from '@ember/controller';

export default Controller.extend({
actions: {
    status: function() {
      this.send('showModal','application-status-form');
    },
    cookie: function() {
    	//set cookie for A/B test
    	Cookies.set('instacookie', true);
    }
  }
});
