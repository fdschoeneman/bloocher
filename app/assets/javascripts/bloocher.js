//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require local_storage_adapter
//= require store

Bloocher = Ember.Application.create();

Bloocher.Store = DS.Store.extend({
  revision: 12,
  adapter: 'DS.FixtureAdapter'
});



