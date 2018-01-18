import Route from '@ember/routing/route';

export default Route.extend({
  model: function(params){
      if(params.email){
        return this.get('store').query('shopper', {
          email: params.email
        }).then(function(shopper) {
          return shopper.content[0];
        });
      }
  },
  setupController: function(controller, shopper) {
    controller.set('model', shopper);
    if(shopper){
      controller.set('update', true);
      controller.set('firstname', shopper._data.firstname);
      controller.set('lastname', shopper._data.lastname);
      controller.set('email', shopper._data.email);
      controller.set('phone', shopper._data.phone);
      controller.set('emaildisabled', true);
    }
    else{
      controller.set('update', false);
    }
  },
	actions: {
    showModal: function(name, model) {
      this.render(name, {
        into: 'application',
        outlet: 'modal',
        model: model
      });
    },
    removeModal: function() {
      this.disconnectOutlet({
        outlet: 'modal',
        parentView: 'application'
      });
    }
  }
});
