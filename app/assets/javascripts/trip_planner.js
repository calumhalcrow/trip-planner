window.TP = Ember.Application.create({LOG_TRANSITIONS: true});


TP.ApplicationController = Ember.Controller.extend({
  appName: 'Trip Planner',
  init: function() {
    var currentUser, existingUser;
    var storedUserId = window.localStorage.currentUserId;
    if (storedUserId) {
      existingUser = TP.User.find(storedUserId);
      if (!existingUser.isNew) {
        currentUser = existingUser;
      }
    }
    this.currentUser = currentUser;
  }
});

TP.Store = DS.Store.extend({
  revision: 12,
  adapter: 'DS.RESTAdapter'
});
DS.RESTAdapter.configure("plurals", {
  destination: "location/destinations",
  home: "location/homes"
});

TP.User = DS.Model.extend({
  name: DS.attr('string'),
  email: DS.attr('string'),
  trips: DS.hasMany('TP.Trip'),
  home: DS.belongsTo('TP.Home')
});

TP.Trip = DS.Model.extend({
  name: DS.attr('string'),
  destination: DS.belongsTo('TP.Destination'),
  connections: DS.hasMany('TP.Connection'),
  user: DS.belongsTo('TP.User')
});

TP.Location = DS.Model.extend({
  name: DS.attr('string'),
  connections: DS.hasMany('TP.Connection')
});
TP.Destination = TP.Location.extend({
  trip: DS.belongsTo('TP.Trip')
});
TP.Home = TP.Location.extend({
  name: DS.attr('string'),
  user: DS.belongsTo('TP.User')
});

TP.Connection = DS.Model.extend({
  name: DS.attr('string'),
  depart_at: DS.attr('date'),
  arrive_at: DS.attr('date'),
  location: DS.belongsTo('TP.Location'),
  trip: DS.belongsTo('TP.Trip')
});



TP.Router.map(function() {
  this.resource('user', {path: '/user/:user_id'});
  this.resource('trip', {path: '/trip/:trip_id'});
  this.route('signout');
});

TP.UserRoute = Ember.Route.extend({
  setupController: function(controller, user) {
    window.localStorage.currentUserId = user.id;
    this.controllerFor('application').set('currentUser', TP.User.find(user.id))
  }
});

TP.SignoutRoute = Ember.Route.extend({
  redirect: function() {
    delete window.localStorage.currentUserId;
    this.controllerFor('application').set('currentUser', null)
    this.transitionTo('index');
  }
});
