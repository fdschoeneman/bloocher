# for more details see: http://emberjs.com/guides/models/defining-models/

Bloocher.Artist = DS.Model.extend
  artistId: DS.attr 'number'
  statement: DS.attr 'string'
