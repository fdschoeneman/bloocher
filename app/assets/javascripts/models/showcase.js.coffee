# for more details see: http://emberjs.com/guides/models/defining-models/

Bloocher.Showcase = DS.Model.extend
  showcaseableId: DS.attr 'number'
  showcaseableType: DS.attr 'string'
  version: DS.attr 'date'
  name: DS.attr 'string'
  description: DS.attr 'string'
  published: DS.attr 'boolean'
