class AddTypeToCertifications < ActiveRecord::Migration
  def change

    add_column :certifications, :certification_type, :string
  end
end
