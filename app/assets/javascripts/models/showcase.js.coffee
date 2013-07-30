# for more details see: http://emberjs.com/guides/models/defining-models/

Bloocher.Showcase = DS.Model.extend
  sommelierId: DS.attr 'number'
  version: DS.attr 'date'
  name: DS.attr 'string'
  description: DS.attr 'string'
  published: DS.attr 'boolean'
