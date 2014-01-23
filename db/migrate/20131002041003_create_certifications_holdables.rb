class CreateCertificationsHoldables < ActiveRecord::Migration
  def change
    create_table :certifications_holdables do |t|
      t.integer :certification_id
      t.integer :holdable_id
      t.date :inception
      t.string :grade
      t.string :holdable_type

      t.timestamps
    end
  end
end
