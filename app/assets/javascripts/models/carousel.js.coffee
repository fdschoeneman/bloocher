# for more details see: http://emberjs.com/guides/models/defining-models/

Bloocher.Carousel = DS.Model.extend
  carousableType: DS.attr 'string'
  carousableId: DS.attr 'number'
  imageId: DS.attr 'number'
