class CreateCertifyingBodies < ActiveRecord::Migration
  def change
    create_table :certifying_bodies do |t|
      t.string :name
      t.string :mission
      t.string :url


      t.timestamps
    end

    add_column :certifications, :certifying_body_id, :integer
    remove_column :certifications, :name, :string
    remove_column :certifications, :url, :string
  end
end
