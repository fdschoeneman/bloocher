Bloocher.Showcase = DS.Model.extend(
  
  name: DS.attr("string")
  description: DS.attr("string")
)

# App.Person = DS.Model.extend({
#   firstName: DS.attr('string'),
#   lastName: DS.attr('string'),
#   birthday: DS.attr('date'),

#   fullName: function() {
#     return this.get('firstName') + ' ' + this.get('lastName');
#   }.property('firstName', 'lastName')
# });