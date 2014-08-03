class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.text :name
      t.references :blades, index: true
      t.references :soaps, index: true

      t.timestamps
    end
  end
end
