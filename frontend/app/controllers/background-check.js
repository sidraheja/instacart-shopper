import Controller from '@ember/controller';

export default Controller.extend({
	actions: {
    createShopper: function() {
      var self = this;
      var newShopper = this.store.createRecord('shopper', this.get('model'));
      newShopper.save().then(function() {
        bootbox.alert("Thank you for applying to be an Instacart Shopper! You can check your application status on the home page.", 
      	function(){ 
      		self.transitionToRoute('index');
      	});
      }).catch(function(error){
      	bootbox.alert("Sorry, There already exists an Instacart shopper with that email.");
      });
    }
  }
});
