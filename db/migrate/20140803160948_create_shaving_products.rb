class CreateShavingProducts < ActiveRecord::Migration
  def change
    create_table :shaving_products do |t|
      t.string :name
      t.text :description
      t.references :brand, index: true
      t.references :reviews, index: true
      t.references :type, index: true

      t.timestamps
    end
  end
end
