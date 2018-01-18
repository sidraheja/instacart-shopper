import Controller from '@ember/controller';

export default Controller.extend({
	actions: {
    checkEmail: function() {
      var self=this;
      if(this.get('email') === undefined || this.get('email') === ""){
        bootbox.alert("Sorry, there is no application with that email!"); 
      }
      else{
        this.get('store').query('shopper', {
          email: self.get('email')
        }).then(function(shopper) {
            if(shopper.content.length === 0){
              bootbox.alert("Sorry, there is no application with that email!");
            }
            else{
              self.transitionToRoute('shopper', shopper.content[0]._data.email);
            }
          }).catch(function(error){
            bootbox.alert("Sorry, there is no application with that email!");
        });
      }
    }
  }
});
