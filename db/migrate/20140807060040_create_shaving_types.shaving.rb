# This migration comes from shaving (originally 20140803161011)
class CreateShavingTypes < ActiveRecord::Migration
  def change
    create_table :shaving_types do |t|
      t.string :name
      t.text :description
      t.references :products, index: true

      t.timestamps
    end
  end
end
