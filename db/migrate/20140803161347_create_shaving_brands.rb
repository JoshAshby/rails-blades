class CreateShavingBrands < ActiveRecord::Migration
  def change
    create_table :shaving_brands do |t|
      t.string :name
      t.references :products, index: true

      t.timestamps
    end
  end
end
