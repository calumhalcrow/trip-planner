window.TP = Ember.Application.create();

TP.ApplicationRoute = Ember.Route.extend({
  setupController: function(controller) {
    controller.set('title', "Hello world!");
  }
});

TP.ApplicationController = Ember.Controller.extend({
  appName: 'Trip Planner'
});



TP.Store = DS.Store.extend({
  revision: 12,
  adapter: 'DS.RESTAdapter'
});

TP.User = DS.Model.extend({
  name: DS.attr('string'),
  email: DS.attr('string'),

  allTheThings: function() {
    return this.get('name') + ' ' + this.get('email');
  }.property('name', 'email');
});



TP.Router.map(function() {
  this.route('user');
});

TP.UserRoute = Ember.Route.extend({
  model: function() {
    return TP.User.find(currentUserId);
  }
});
