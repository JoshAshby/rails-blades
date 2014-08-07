class CreateShavingReviews < ActiveRecord::Migration
  def change
    create_table :shaving_reviews do |t|
      t.text :comments
      t.integer :overall_rating
      t.integer :face_feel
      t.integer :shaving_feel
      t.references :product, index: true

      t.timestamps
    end
  end
end
