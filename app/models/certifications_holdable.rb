class CertificationsHoldable < ActiveRecord::Base

	belongs_to :certification
	belongs_to :holdable, polymorphic: true
end

# class Certification < ActiveRecord::Base

#   has_many :certifications_holdables
#   # has_many :holdables, through: :certifications_holdables, source_type: "Holdable"
#   has_many :wines, through: :certifications_holdables, source: :holdable, source_type: :vineyard
# end


# class Widget < ActiveRecord::Base
#   has_many :widget_groupings

#   has_many :people, :through => :widget_groupings, :source => :grouper, :source_type => 'Person'
#   has_many :aliens, :through => :widget_groupings, :source => :grouper, :source_type => 'Alien'
# end

# class Person < ActiveRecord::Base
#   has_many :widget_groupings, :as => grouper
#   has_many :widgets, :through => :widget_groupings
# end

# class Alien < ActiveRecord::Base
#   has_many :widget_groupings, :as => grouper
#   has_many :widgets, :through => :widget_groupings  
# end

# class WidgetGrouping < ActiveRecord::Base
#   belongs_to :widget
#   belongs_to :grouper, :polymorphic => true
# end