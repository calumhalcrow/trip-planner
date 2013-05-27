window.TP = Ember.Application.create({LOG_TRANSITIONS: true});


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
});

TP.IndexRoute = Ember.Route.extend({
  setupController: function(controller) {
    controller.set('title', "Hello world!");
  }
});
