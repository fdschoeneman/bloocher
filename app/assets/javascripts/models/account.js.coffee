# for more details see: http://emberjs.com/guides/models/defining-models/

Bloocher.Account = DS.Model.extend
  accountableId: DS.attr 'number'
  accountableType: DS.attr 'string'
  subdomain: DS.attr 'string'
