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

TP.Adapter = DS.RESTAdapter.extend();
TP.Adapter.map('TP.Trip', {
  connections: { embedded: 'always' }
 });

TP.Store = DS.Store.extend({
  revision: 12,
  adapter: 'TP.Adapter'
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

TP.TripsRoute = Ember.Route.extend({
  model: function() {
    return TP.Trip.all();
  }
});



TP.TripsNewRoute = Ember.Route.extend({
  model: function() {
    // Because we are maintaining a transaction locally in the controller for editing,
    // the new record needs to be created in the controller.
    return null;
  },

  setupController: function(controller) {
    this._super.apply(this, arguments);
    controller.startEditing();
  },

  deactivate: function() {
    this.controllerFor('trips.new').stopEditing();
  }
});

TP.TripsNewController = Ember.ObjectController.extend({

  startEditing: function() {
    // create a new record on a local transaction

    this.transaction = this.get('store').transaction();

    this.set('model', this.transaction.createRecord(
      TP.Trip,
      {user: this.controllerFor('application').get('currentUser')}
    ));
  },

  stopEditing: function() {
    // rollback the local transaction if it hasn't already been cleared
    if (this.transaction) {
      this.transaction.rollback();
      this.transaction = null;
    }
  },

  save: function() {
    // commit and then clear the local transaction
    this.transaction.commit();
    this.transaction = null;
  },

  transitionAfterSave: function() {
    // when creating new records, it's necessary to wait for the record to be assigned
    // an id before we can transition to its route (which depends on its id)
    if (this.get('model.id')) {
      this.transitionToRoute('trip', this.get('model'));
    }
  }.observes('model.id'),

  cancel: function() {
    this.stopEditing();
    this.transitionToRoute('trips.index');
  },

  addConnection: function() {
    this.get('model.connections').createRecord();
  },

  removeConnection: function(connection) {
    connection.deleteRecord();
  }
});

TP.SignoutRoute = Ember.Route.extend({
  redirect: function() {
    delete window.localStorage.currentUserId;
    this.controllerFor('application').set('currentUser', null);
    this.transitionTo('index');
  }
});
