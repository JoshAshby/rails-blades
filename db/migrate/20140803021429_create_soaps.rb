class CreateSoaps < ActiveRecord::Migration
  def change
    create_table :soaps do |t|
      t.text :name
      t.text :description
      t.references :brand, index: true

      t.timestamps
    end
  end
end
