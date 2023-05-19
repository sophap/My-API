class CreateVolcanos < ActiveRecord::Migration[7.0]
  def change
    create_table :volcanos do |t|
      t.integer :volcano_id
      t.string :volcano_name
      t.string :country
      t.string :region
      t.string :subregion
      t.float :latitude
      t.float :longitude
      t.string :pei
      t.string :h_active
      t.string :vei_holoce
      t.string :hazard
      t.string :classification
      t.string :risk

      t.timestamps
    end
  end
end
