window.TP = Ember.Application.create({LOG_TRANSITIONS: true});
Ember.TESTING_DEPRECATION = true;


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

TP.User = DS.Model.extend({
  name: DS.attr('string'),
  email: DS.attr('string'),
  home: DS.attr('string'),
  trips: DS.hasMany('TP.Trip'),
});
TP.Trip = DS.Model.extend({
  name: DS.attr('string'),
  destination: DS.attr('string'),
  connections: DS.hasMany('TP.Connection'),
  user: DS.belongsTo('TP.User')
});
TP.Connection = DS.Model.extend({
  name: DS.attr('string'),
  depart_at: DS.attr('date'),
  arrive_at: DS.attr('date'),
  stop: DS.attr('string'),
  trip: DS.belongsTo('TP.Trip')
});



TP.Router.map(function() {
  this.resource('users', {path: '/users'}, function () {
    this.resource('user', {path: '/:user_id'});
  });

  this.resource('trips', {path: '/trips'}, function () {
    this.resource('trip', {path: '/:trip_id'});
    this.route('new');
  });

  this.route('signout');
});

TP.UserRoute = Ember.Route.extend({
  setupController: function(controller, user) {
    window.localStorage.currentUserId = user.id;
    this.controllerFor('application').set('currentUser', TP.User.find(user.id));
  }
});

TP.SignoutRoute = Ember.Route.extend({
  redirect: function() {
    delete window.localStorage.currentUserId;
    this.controllerFor('application').set('currentUser', null);
    this.transitionTo('index');
  }
});
