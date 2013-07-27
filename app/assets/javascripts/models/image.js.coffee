# for more details see: http://emberjs.com/guides/models/defining-models/

Bloocher.Image = DS.Model.extend
  image: DS.attr 'string'
  title: DS.attr 'string'
  description: DS.attr 'string'
  contentType: DS.attr 'string'
  imageableId: DS.attr 'number'
  imageableType: DS.attr 'string'
  active: DS.attr 'string'
  slug: DS.attr 'string'
