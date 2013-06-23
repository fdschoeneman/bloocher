class AppellationsVineyard < ActiveRecord::Base
  attr_accessible :appellation_id, :vineyard_id

  belongs_to :appellation
  belongs_to :vineyard
end
