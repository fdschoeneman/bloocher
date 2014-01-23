class AppellationsVineyard < ActiveRecord::Base

  belongs_to :appellation
  belongs_to :vineyard
end
