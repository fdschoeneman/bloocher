# for more details see: http://emberjs.com/guides/models/defining-models/

Bloocher.Authentication = DS.Model.extend
  userId: DS.attr 'number'
  provider: DS.attr 'string'
  uid: DS.attr 'string'
  uname: DS.attr 'string'
  uemail: DS.attr 'string'
