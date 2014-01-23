class AddShowcaseableToShowcases < ActiveRecord::Migration
  def change
    add_reference :showcases, :showcaseable, polymorphic: true, index: true, unique: true
  end
end
