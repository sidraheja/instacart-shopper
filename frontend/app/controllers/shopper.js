import Controller from '@ember/controller';

export default Controller.extend({
	displayErrors:false,
	errors:"",
      firstname: Ember.computed(function() {
            if(this.get('model')){
                  return this.get("model")._data.firstname;
            }
            else{
                  return undefined;
            }
      }),
      lastname: Ember.computed(function() {
            if(this.get('model')){
                  return this.get("model")._data.lastname;
            }
            else{
                  return undefined;
            }
      }),
      email: Ember.computed(function() {
            if(this.get('model')){
                  return this.get("model")._data.email;
            }
            else{
                  return undefined;
            }
      }),
      phone: Ember.computed(function() {
            if(this.get('model')){
                  return this.get("model")._data.phone;
            }
            else{
                  return undefined;
            }
      }),
	actions: {
    createUser: function() {
      this.set('displayErrors', false);
      this.set('errors', "");
      this.set('firstname', this.firstname);
      this.set('lastname', this.lastname);
      this.set('email', this.email);
      this.set('phone', this.phone);
      //Form Validation
      if(this.get('firstname') === undefined || this.get('firstname') === ""){
      	this.set('displayErrors', true);
      	this.set('errors', "First Name cannot be blank");
      }
      else if(this.get('lastname') === undefined || this.get('lastname') === ""){
      	this.set('displayErrors', true);
      	this.set('errors', "Last Name cannot be blank");
      }
      else if(this.get('email') === undefined || this.get('email') === ""){
      	this.set('displayErrors', true);
      	this.set('errors', "Email cannot be blank");
      }
      else if(this.get('phone') === undefined || this.get('phone') === ""){
      	this.set('displayErrors', true);
      	this.set('errors', "Phone cannot be blank");
      }
      if(!this.get('displayErrors')){
            var shopperObject = {
                  firstname : this.get('firstname'),
                  lastname : this.get('lastname'),
                  email: this.get('email'),
                  phone: this.get('phone')
            }; 
            //update not create
            if(this.get('update') === true){
                  var self = this;
                  this.get('store').query('shopper', {
                  email: this.get('email')
                  }).then(function(shopper) {
                        shopper.content[0]._data = shopperObject;
                        shopper.save().then(function(){
                              bootbox.alert("Your application has been updated!");
                        });
                  })    
            }
            else{
            	//create the object
                  this.send('showModal','background-check', shopperObject);
            }
      }
    }
  }
});
