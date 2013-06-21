class CreateCertificationsProducers < ActiveRecord::Migration
  def change
    create_table :certifications_producers do |t|
      t.integer :producer_id
      t.integer :certification_id
      t.date 		:certified_since

      t.timestamps
    end
  end
end
